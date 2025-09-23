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

#define CLOCK_BASE_RESET UINT64_C(0x00058014)

#define GPIO_REG_ADDR UINT64_C(0x0)

#define BASE_ADDR UINT64_C(0x0C0000000)


/* use the stdout logger for printing debug information  */
static const struct logger *logger = &logger_stdout;

/* Declaring the local functions */
int peek_poke_example(int slot, int pf_id, int bar_id);
int vled_example(int slot);


int main(int argc, char **argv) {
    int rc;
    int slot_id;

    /* setup logging to print to stdout */
    rc = log_init("hello_world");
    fail_on(rc, out, "Unable to initialize the log.");
    rc = log_attach(logger, NULL, 0);
    fail_on(rc, out, "%s", "Unable to attach to the log.");

    /* initialize the fpga_mgmt library */
    rc = fpga_mgmt_init();
    fail_on(rc, out, "Unable to initialize the fpga_pci library");

    /* This demo works with single FPGA slot, we pick slot #0 as it works for both f1.2xl and f1.16xl */

    slot_id = 0;

    /* check that the AFI is loaded */
    log_info("Checking to see if the right AFI is loaded...");

    printf("\n");

    printf("===== Hello World Example =====\n");
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
    int rc_pcis;
    int rc_sda;

    /* pci_bar_handle_t is a handler for an address space exposed by one PCI BAR on one of the PCI PFs of the FPGA */

    pci_bar_handle_t pci_bar_handle = PCI_BAR_HANDLE_INIT;
    pci_bar_handle_t pci_bar_handle_pcis = PCI_BAR_HANDLE_INIT;
    pci_bar_handle_t pci_bar_handle_sda = PCI_BAR_HANDLE_INIT;


    /* attach to the fpga, with a pci_bar_handle out param
     * To attach to multiple slots or BARs, call this function multiple times,
     * saving the pci_bar_handle to specify which address space to interact with in
     * other API calls.
     * This function accepts the slot_id, physical function, and bar number
     */
    rc = fpga_pci_attach(slot_id, pf_id, bar_id, 0, &pci_bar_handle);
    fail_on(rc, out, "Unable to attach to the AFI on slot id %d", slot_id);

    rc_pcis = fpga_pci_attach(slot_id, pf_id, 4, 0, &pci_bar_handle_pcis);
    fail_on(rc_pcis, out, "Unable to attach to the AFI on slot id %d", slot_id);

    rc_sda = fpga_pci_attach(slot_id, FPGA_MGMT_PF, MGMT_PF_BAR4, 0, &pci_bar_handle_sda);
    fail_on(rc_sda, out, "Unable to attach to the AFI on slot id %d", slot_id);

    uint32_t value;

    int b0;
    int b1;
    int b2;
    int b3;

    int loop_var;

    printf("CL out of reset with SDA\n");

    value = 0x00000000;

    rc_sda = fpga_pci_poke(pci_bar_handle_sda, CLOCK_BASE_RESET, value);
    fail_on(rc_sda, out, "Unable to read read from the fpga !");

    printf("Writing for VLED (0xAAAA) with OCL-AXI GPIO\n");

    value = 0x0000AAAA;

    rc = fpga_pci_poke(pci_bar_handle, GPIO_REG_ADDR, value);
    fail_on(rc, out, "Unable to write to the fpga !");

    printf(
        "Use the following command to get the VLED value after running the software\n"
        "# sudo fpga-get-virtual-led  -S 0\n"
        "FPGA slot id 0 have the following Virtual LED:\n"
        "1010-1010-1010-1010\n"
    );

    printf("\n");

    printf("Writing to AXI BRAM with ASCII\n");

    rc_pcis = fpga_pci_poke(pci_bar_handle_pcis, (BASE_ADDR + 0x00000000), 0x6C6C6548);
    fail_on(rc_pcis, out, "Unable to write to the fpga !");

    rc_pcis = fpga_pci_poke(pci_bar_handle_pcis, (BASE_ADDR + 0x00000004), 0x6F57206F);
    fail_on(rc_pcis, out, "Unable to write to the fpga !");

    rc_pcis = fpga_pci_poke(pci_bar_handle_pcis, (BASE_ADDR + 0x00000008), 0x21646C72);
    fail_on(rc_pcis, out, "Unable to write to the fpga !");

    printf("\n");
    printf("Reading ASCII from AXI BRAM\n");

    for ( loop_var = 0; loop_var < 3; loop_var++ ) {
        rc_pcis = fpga_pci_peek(pci_bar_handle_pcis, (BASE_ADDR + loop_var*4), &value);
        fail_on(rc_pcis, out, "Unable to read read from the fpga !");
        //printf("register: 0x%x\n", value);

        b0 = (value >> 0) & 0xff;
        b1 = (value >> 8) & 0xff;
        b2 = (value >> 16) & 0xff;
        b3 = (value >> 24) & 0xff;

        printf("%c\n", b0);
        printf("%c\n", b1);
        printf("%c\n", b2);
        printf("%c\n", b3);
    }

out:
    /* clean up */
    if (pci_bar_handle >= 0) {
        rc = fpga_pci_detach(pci_bar_handle);
        if (rc) {
            printf("Failure while detaching from the fpga.\n");
        }
    }

    if (pci_bar_handle_pcis >= 0) {
        rc_pcis = fpga_pci_detach(pci_bar_handle_pcis);
        if (rc_pcis) {
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
    return (rc || rc_pcis || rc_sda != 0 ? 1 : 0);
}
