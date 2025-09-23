/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 */

#include <stdio.h>
#include "platform.h"
#include "xil_io.h"


#define bram_base 0xC0000000
#define gpio_base 0x100000

int main()
{

    int mb_read = 0;

    //Write value into BRAM and set GPIO (bit 0)
    Xil_Out32(bram_base,0xDEADBEEF);

    Xil_Out32(gpio_base,0x00000001);

    mb_read = Xil_In32(gpio_base);

    //Wait until host writes into BRAM and sets GPIO
    while (mb_read != 0x00000003) {
        mb_read = Xil_In32(gpio_base);
    }

    //Read write from MicroBlaze
    mb_read = Xil_In32(bram_base+0x00000004);

    //Make sure read value is correct and set GPIO (bit2, bit1, bit0)
    if (mb_read == 0xBEEFDEAD) {
        Xil_Out32(gpio_base,0x00000007);
    }

    return 0;
}
