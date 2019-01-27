        .global array
array:  .long 3
        .long 8
        .long 11
        .long 55

        NOP

        // There are only 4 registers
        ADD R0, R1, R2        //R0 = R1 + R2
        ADD R1, R2, R3        //R1 = R2 + R3

        ADD R1, R2, 0xABCD    //R1 = R2 + 0xABCD

        SUB R3, R0, R1        //R3 = R0 - R1
        SUB R3, R0, 0xABCD    //R3 = R0 - 0xABCD

        AND R0, R2, R3        //R1 = R2 & R3
        AND R3, R2, 0xABCD    //R1 = R2 & 0xABCD

        OR R1, R2, R3         //R1 = R2 | R3
        OR R1, R2, 0xABCD     //R1 = R2 | 0xABCD

        LSH R1, R2, R3         //R1 = R2 << R3
        LSH R1, R2, 0xABCD     //R1 = R2 << 0xABCD

        RSH R1, R2, R3         //R1 = R2 >> R3
        RSH R1, R2, 0xABCD     //R1 = R2 >> 0xABCD

        MOVE R0, array
        MOVE R1, array
        MOVE R2, array
        MOVE R3, array

        MOVE R2, 0x0    
        MOVE R2, 0xABCD

        ST R2, R1, 0x34
        ST R2, R1, 0      // write value of R2 into the first array element,
                          // i.e. array[0]

        JUMP       label         // Jump to label
label:
        NOP                      // Definition of label

label2: SUB         R0, R0, 1    // R0--
        NOP                      // do something
        JUMPR       label, 1, GE // jump to label if R0 >= 1

        ST R2, R1, 4      // write value of R2 into the second array element
                          // (4 byte offset), i.e. array[1]

// JUMPS target, threshold, EQ is implemented as:

         JUMPS target, 0xAB, EQ
         JUMPS target, 0xAB, LT
         JUMPS target, 0xAB, LE
         JUMPS target, 0xAB, GT
         JUMPS target, 0xAB, GE
target:  NOP
         STAGE_RST
         STAGE_INC 0xCD
         STAGE_DEC 0xEF
         HALT
         WAKE
         SLEEP 0xABCD
         WAIT  0xABCD
         TSENS R1, 0xABCD
         ADC      R1, 0, 5      // Measure value using ADC1 pad 2 and store result into 1
         ADC      R3, 1, 3      // Measure value using ADC1 pad 2 and store result into 1         

         // Syntax
         //    I2C_RD Sub_addr, High, Low, Slave_sel
         // Operands
         //    Sub_addr – Address within the I2C slave to read.
         //    High, Low — Define range of bits to read. Bits outside of [High, Low] range are masked.
         //    Slave_sel - Index of I2C slave address to use.
         I2C_RD      0xAB, 0xEF, 0x23, 1      // Read byte from sub-address 0x10 of slave with address set in SENS_I2C_SLAVE_ADDR0


         I2C_WR      0xAB, 0xEF, 7, 0, 1      // Write byte 0x33 to sub-address 0x20 of slave with address set in SENS_I2C_SLAVE_ADDR1.

         REG_RD      0x120, 2, 0         // load 4 bits: R0 = {12'b0, REG[0x120][7:4]}

         // Syntax
         //    REG_WR Addr, High, Low, Data
         // Operands
         //    Addr – register address, in 32-bit words.
         //    High – High part of R0
         //    Low – Low part of R0
         //    Data – value to write, 8 bits
         REG_WR      0x120, 7, 0, 0x10   // set 8 bits: REG[0x120][7:0] = 0x10
