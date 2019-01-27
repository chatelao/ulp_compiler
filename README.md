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
| Imm[15:12] / R-Src2 | R-Dest | R-Src1 | Imm[11:4] | Func | Imm[3:0] | OpCode |  Addr-Mode |

| Func | OpCode |  Addr-Mode |
|----|----|----|
| 0: ADD ("+") <BR> 2: SUB ("-") <BR> 4: AND ("&&")<BR>6: OR ("&#124;&#124;")<BR>8: MOVE<BR>A: LSH ("<<")<BR>C: RSH (">>") |1: REG_WR<BR>2: REG_RD<BR>3: I2C<BR>4: NOP<BR>6: STORE<BR>7: ALU<BR>8: JUMP | 0: REG2<br>2: REM+IMM<br>3: PCRel?<br>4: PC?<br>5: COND
