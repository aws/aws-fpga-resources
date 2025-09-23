// ============================================================================
// Amazon FPGA Hardware Development Kit
//
// Copyright 2025 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License"). You may not use
// this file except in compliance with the License. A copy of the License is
// located at
//
//    http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
// implied. See the License for the specific language governing permissions and
// limitations under the License.
// ============================================================================


#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <poll.h>

#include <fpga_pci.h>
#include <fpga_mgmt.h>
#include <utils/lcd.h>

/* Constants determined by the CL */
/* a set of register offsets; this CL has only one */
/* these register addresses should match the addresses in */
/* /aws-fpga/hdk/cl/examples/common/cl_common_defines.vh */

#define CLOCK_BASE_RESET UINT64_C(0x00058014)

#define HELLO_WORLD_REG_ADDR UINT64_C(0x0010000)

#define DDR_ADDR UINT64_C(0x1001000000)
#define HBM_ADDR UINT64_C(0x200000000)

#define HELLO_WORLD_REG_ADDR_CONTROL UINT64_C(0x00)
#define HELLO_WORLD_REG_ADDR_STATUS UINT64_C(0x04)

#define HELLO_WORLD_REG_ADDR_SRC_MSB_ADDR UINT64_C(0x1C)
#define HELLO_WORLD_REG_ADDR_DST_MSB_ADDR UINT64_C(0x24)

#define HELLO_WORLD_REG_ADDR_SRC_ADDR UINT64_C(0x18)
#define HELLO_WORLD_REG_ADDR_DST_ADDR UINT64_C(0x20)
#define HELLO_WORLD_REG_ADDR_BYTES UINT64_C(0x28)



/* use the stdout logger for printing debug information  */
static const struct logger *logger = &logger_stdout;

/* Declaring the local functions */

int peek_poke_example(int slot, int pf_id, int bar_id);
//int vled_example(int slot);


int main(int argc, char **argv) {
    int rc;
    int slot_id;

    /* setup logging to print to stdout */
    rc = log_init("cl_ipi_cdma_test");
    fail_on(rc, out, "Unable to initialize the log.");
    rc = log_attach(logger, NULL, 0);
    fail_on(rc, out, "%s", "Unable to attach to the log.");


    /* initialize the fpga_mgmt library so we could have access to FPGA PCIe from this applications */
    rc = fpga_mgmt_init();
    fail_on(rc, out, "Unable to initialize the fpga_mgmt library");

    /* This demo works with single FPGA slot, we pick slot #0 as it works for both f1.2xl and f1.16xl */

    slot_id = 0;

    /* check that the AFI is loaded */
    log_info("Checking to see if the right AFI is loaded...");

    /* Accessing the CL registers via AppPF BAR0, which maps to sh_cl_ocl_ AXI-Lite bus between AWS FPGA Shell and the CL*/

    printf("\n");

    printf("===== AXI CDMA Example =====\n");
    rc = peek_poke_example(slot_id, FPGA_APP_PF, APP_PF_BAR0);
    fail_on(rc, out, "peek-poke example failed");

    printf("*** TEST PASSED ***\n");
    return rc;
out:
    printf("*** TEST FAILED ***\n");
    return 1;
}



/*
 * An example to attach to an arbitrary slot, pf, and bar with register access.
 */
int peek_poke_example(int slot_id, int pf_id, int bar_id) {
    int rc;
    int rc_2;
    int rc_sda;

    /* pci_bar_handle_t is a handler for an address space exposed by one PCI BAR on one of the PCI PFs of the FPGA */

    pci_bar_handle_t pci_bar_handle = PCI_BAR_HANDLE_INIT;
    pci_bar_handle_t pci_bar_handle_xdma = PCI_BAR_HANDLE_INIT;

    pci_bar_handle_t pci_bar_handle_sda = PCI_BAR_HANDLE_INIT;


    /* attach to the fpga, with a pci_bar_handle out param
     * To attach to multiple slots or BARs, call this function multiple times,
     * saving the pci_bar_handle to specify which address space to interact with in
     * other API calls.
     * This function accepts the slot_id, physical function, and bar number
     */
    rc = fpga_pci_attach(slot_id, pf_id, bar_id, 0, &pci_bar_handle);
    fail_on(rc, out, "Unable to attach to the AFI on slot id %d", slot_id);



    rc_2 = fpga_pci_attach(slot_id, pf_id, 4, 0, &pci_bar_handle_xdma);
    fail_on(rc_2, out, "Unable to attach to the AFI on slot id %d", slot_id);

    rc_sda = fpga_pci_attach(slot_id, FPGA_MGMT_PF, MGMT_PF_BAR4, 0, &pci_bar_handle_sda);
    fail_on(rc_sda, out, "Unable to attach to the AFI on slot id %d", slot_id);

    uint32_t value;


    int loop_var = 0;


    printf("CL out of reset with SDA\n");

    value = 0x00000000;

    rc_sda = fpga_pci_poke(pci_bar_handle_sda, CLOCK_BASE_RESET, value);
    fail_on(rc_sda, out, "Unable to read read from the fpga !");


    printf("Checking DDR4 and HBM Calibration with OCL-AXI GPIO\n");

    rc = fpga_pci_peek(pci_bar_handle, HELLO_WORLD_REG_ADDR, &value);
    //rc = fpga_pci_peek(pci_bar_handle, HELLO_WORLD_REG_ADDR, &value);
    fail_on(rc, out, "Unable to read read from the fpga !");

   while(value != 0x00000003)
    {
    rc = fpga_pci_peek(pci_bar_handle, HELLO_WORLD_REG_ADDR, &value);
    fail_on(rc_sda, out, "Unable to read read from the fpga !");
    printf("register: 0x%x\n", value);
    }
    printf("DDR4 and HBM Calibrated! GPIO Input Value: 0x%x\n", value);

    printf("\n");

    printf("\n");

    printf("Writing to DDR4 Source Buffer 1KB\n");

    for ( loop_var = 0; loop_var < 256; loop_var++ ) {
       rc_2 = fpga_pci_poke(pci_bar_handle_xdma, (DDR_ADDR + loop_var*4), loop_var);
       fail_on(rc_2, out, "Unable to write to the fpga !");

    }
    printf("Finished writing to DDR4 Source Buffer\n");

    printf("\n");
    printf("Setting Up CDMA Transfers with USR-AXI CDMA AXI4 Lite Registers\n");

    value = 0x01000000;
    rc = fpga_pci_poke(pci_bar_handle, HELLO_WORLD_REG_ADDR_SRC_ADDR, value);
    fail_on(rc, out, "Unable to write to the fpga !");

    value = 0x00000010;
    rc = fpga_pci_poke(pci_bar_handle, HELLO_WORLD_REG_ADDR_SRC_MSB_ADDR, value);
    fail_on(rc, out, "Unable to write to the fpga !");

    value = 0x00000000;
    rc = fpga_pci_poke(pci_bar_handle, HELLO_WORLD_REG_ADDR_DST_ADDR, value);
    fail_on(rc, out, "Unable to write to the fpga !");

    value = 0x00000002;
    rc = fpga_pci_poke(pci_bar_handle, HELLO_WORLD_REG_ADDR_DST_MSB_ADDR, value);
    fail_on(rc, out, "Unable to write to the fpga !");

    value = 0x00000400;
    rc = fpga_pci_poke(pci_bar_handle, HELLO_WORLD_REG_ADDR_BYTES, value);
    fail_on(rc, out, "Unable to write to the fpga !");
    printf("Executing CDMA Transfers on DDR4_SH and polling status register\n");
    printf("\n");

    rc = fpga_pci_peek(pci_bar_handle, HELLO_WORLD_REG_ADDR_STATUS, &value);
    fail_on(rc, out, "Unable to read read from the fpga !");

    while(value != 0x00001002)
    {
    rc = fpga_pci_peek(pci_bar_handle, HELLO_WORLD_REG_ADDR_STATUS, &value);
    fail_on(rc, out, "Unable to read read from the fpga !");
    }
    printf("CDMA Transfer Complete!\n");
    printf("AXI CDMA Status Register Value: 0x%x\n", value);

    printf("\n");
    printf("Reading and verifying HBM Dst Buffer 1KB\n");

    for ( loop_var = 0; loop_var < 256; loop_var++ ) {

       rc_2 = fpga_pci_peek(pci_bar_handle_xdma, (HBM_ADDR + loop_var*4), &value);
       fail_on(rc_2, out, "Unable to read read from the fpga !");
       //printf("register: 0x%x\n", value);

       if (value != loop_var)
        {
          printf("Data mismatch!");
        }
    }

    printf("\n");
    printf("CDMA Transfer Successful!\n");

out:
    /* clean up */
    if (pci_bar_handle >= 0) {
        rc = fpga_pci_detach(pci_bar_handle);
        if (rc) {
            printf("Failure while detaching from the fpga.\n");
        }
    }

    if (pci_bar_handle_xdma >= 0) {
        rc_2 = fpga_pci_detach(pci_bar_handle_xdma);
        if (rc_2) {
            printf("Failure while detaching from the fpga.\n");
        }
    }

    if (pci_bar_handle_sda >= 0) {
        rc_sda = fpga_pci_detach(pci_bar_handle_sda);
        if (rc_sda) {
            printf("Failure while detaching from the fpga.\n");
        }
    }

    /* if there is an error code, exit with status 1 */
    return (rc || rc_2 || rc_sda != 0 ? 1 : 0);
}
