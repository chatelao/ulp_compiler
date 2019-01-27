# Manuals

## ULP documentation
* ULP-Programming Guide: https://docs.espressif.com/projects/esp-idf/en/latest/api-guides/ulp.html
* 
Toolchain Espressif:
* https://github.com/espressif/binutils-esp32ulp/releases
* Download
* Run the "esp32ulp-elf-as.exe" compiler 

## LLVM samples
* RISC-V Sample: https://github.com/llvm-mirror/llvm/tree/master/lib/Target/RISCV

## OpCode ISA

| 4 Bit[31:28] | 2 Bit[27:26] | 2 Bit[25:24] | 8 Bit[23:16] | 4 Bit[15:12] | 4 Bit[11:8] | 4 Bit[[7:4] | 4 Bit[3:0] |
|----|----|----|----|----|----|----|----|
| Imm[15:12] / R-Src2 | R-Dest | R-Src1 | Imm[11:4] | Func | Imm[3:0] | OpCode |  OP2-Mode |
| | | | | 0: ADD (+) <BR> 2: SUB (-) <BR> 4: AND (&)<BR>6: OR (&#124;)<BR>8: MOVE<BR>A: LSH<BR>C: RSH
