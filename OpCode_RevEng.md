   1                            .global array
   2 0000 03000000      array:  .long 3
   3 0004 08000000              .long 8
   4 0008 0B000000              .long 11
   5 000c 37000000              .long 55
   6
   7 0010 00000040              NOP
   8
   9                            // There are only 4 registers
  10 0014 38000070              ADD R0, R2, R3        //R1 = R2 + R3
  11 0018 39000070              ADD R1, R2, R3        //R1 = R2 + R3
  12
  13 001c D9BC0A72              ADD R1, R2, 0xABCD    //R1 = R2 + 0xABCD
  14
  15 0020 39002070              SUB R1, R2, R3        //R1 = R2 - R3
  16 0024 D9BC2A72              SUB R1, R2, 0xABCD    //R1 = R2 - 0xABCD
  17
  18 0028 39004070              AND R1, R2, R3        //R1 = R2 & R3
  19 002c D9BC4A72              AND R1, R2, 0xABCD    //R1 = R2 & 0xABCD
  20
  21 0030 39006070              OR R1, R2, R3         //R1 = R2 | R3
  22 0034 D9BC6A72              OR R1, R2, 0xABCD     //R1 = R2 | 0xABCD
  23
  24 0038 3900A070              LSH R1, R2, R3         //R1 = R2 << R3
  25 003c D9BCAA72              LSH R1, R2, 0xABCD     //R1 = R2 << 0xABCD
  26
  27 0040 3900C070              RSH R1, R2, R3         //R1 = R2 >> R3
  28 0044 D9BCCA72              RSH R1, R2, 0xABCD     //R1 = R2 >> 0xABCD
  29
  30 0048 00008072              MOVE R0, array
  31 004c 01008072              MOVE R1, array
  32 0050 02008072              MOVE R2, array
  33 0054 03008072              MOVE R3, array
  34
  35 0058 02008072              MOVE R2, 0x0
  36 005c D2BC8A72              MOVE R2, 0xABCD
  37
  38 0060 06340068              ST R2, R1, 0x34
  39 0064 06000068              ST R2, R1, 0      // write value of R2 into the first array element,
  40                                              // i.e. array[0]
  41
  42 0068 6C000080              JUMP       label         // Jump to label
  43                    label:
  44 006c 00000040              NOP                      // Definition of label
  45
  46 0070 10002072      label2: SUB         R0, R0, 1    // R0--
  47 0074 00000040              NOP                      // do something
  48 0078 01000783              JUMPR       label, 1, GE // jump to label if R0 >= 1
  49
  50 007c 06040068              ST R2, R1, 4      // write value of R2 into the second array element
  51                                              // (4 byte offset), i.e. array[1]
  52
  53                    // JUMPS target, threshold, EQ is implemented as:
  54
  55 0080 AB000484               JUMPS target, 0xAB, EQ
  55      AB000D84
  56 0088 AB000A84               JUMPS target, 0xAB, LT
  57 008c AB000984               JUMPS target, 0xAB, LE
  58 0090 AB000584               JUMPS target, 0xAB, GT
  58      AB800484
  59 0098 AB800284               JUMPS target, 0xAB, GE
  60 009c 00000040      target:  NOP
  61 00a0 00004074               STAGE_RST
  62 00a4 D00C0074               STAGE_INC 0xCD
  63 00a8 F00E2074               STAGE_DEC 0xEF
  64 00ac 000000B0               HALT
  65 00b0 01000090               WAKE
  66 00b4 0D000092               SLEEP 0xABCD
  67 00b8 CDAB0040               WAIT  0xABCD
  68 00bc 35AF00A0               TSENS R1, 0xABCD
  69 00c0 15000050               ADC      R1, 0, 5      // Measure value using ADC1 pad 2 and store result into 1
  70 00c4 4F000050               ADC      R3, 1, 3      // Measure value using ADC1 pad 2 and store result into 1       
  71
  72                             // Syntax
  73                             //    I2C_RD Sub_addr, High, Low, Slave_sel
  74                             // Operands
  75                             //    Sub_addr â?" Address within the I2C slave to read.
  76                             //    High, Low â?" Define range of bits to read. Bits outside of [High, Low] range are ma
  77                             //    Slave_sel - Index of I2C slave address to use.
  78 00c8 AB007B30               I2C_RD      0xAB, 0xEF, 0x23, 1      // Read byte from sub-address 0x10 of slave with addr
  79
  80
  81 00cc ABEF7838               I2C_WR      0xAB, 0xEF, 7, 0, 1      // Write byte 0x33 to sub-address 0x20 of slave with
  82
  83 00d0 20010021               REG_RD      0x120, 2, 0         // load 4 bits: R0 = {12'b0, REG[0x120][7:4]}
  84
  85                             // Syntax
  86                             //    REG_WR Addr, High, Low, Data
  87                             // Operands
  88                             //    Addr â?" register address, in 32-bit words.
  89                             //    High â?" High part of R0
  90                             //    Low â?" Low part of R0
  91                             //    Data â?" value to write, 8 bits
  92 00d4 20418013               REG_WR      0x120, 7, 0, 0x10   // set 8 bits: REG[0x120][7:0] = 0x10
DEFINED SYMBOLS
             test2.S:2      .text:00000000 array
             test2.S:43     .text:0000006c label
             test2.S:46     .text:00000070 label2
             test2.S:60     .text:0000009c target

NO UNDEFINED SYMBOLS
