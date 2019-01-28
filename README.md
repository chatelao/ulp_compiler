# Manuals

## ULP documentation
* ULP-Programming Guide: https://docs.espressif.com/projects/esp-idf/en/latest/api-guides/ulp.html
* 
Toolchain Espressif:
* https://github.com/espressif/binutils-esp32ulp/releases
* Download
* Run the "esp32ulp-elf-as.exe" compiler 

## LLVM samples
* LLVM Backend integration (video): https://www.youtube.com/watch?v=AFaIP-dF-RA&t=1686s
* RISC-V Sample: https://github.com/llvm-mirror/llvm/tree/master/lib/Target/RISCV


## OpCode ISA

| 4 Bit[31:28] | 2 Bit[27:26] | 2 Bit[25:24] | 4 Bit[23:21] | 4 Bit[20:16] | 4 Bit[15:12] | 4 Bit[11:8] | 4 Bit[[7:4] | 4 Bit[3:0] |
|----|----|----|----|----|----|----|----|----|
| Imm[15:12] / R-Src2 | R-Dest | R-Src1 | Imm[7:4] | Imm[11:8] | Func | Imm[3:0] | OpCode |  Addr-Mode |

| Func | OpCode |  Addr-Mode |
|----|----|----|
| 0: ADD ("+") <BR> 2: SUB ("-") <BR> 4: AND ("&&")<BR>6: OR ("&#124;&#124;")<BR>8: MOVE<BR>A: LSH ("<<")<BR>C: RSH (">>") |1: PREG_WR<BR>2: PREG_RD<BR>3: I2C<BR>4: NOP<BR>6: STORE<BR>7: ALU<BR>8: JUMP | 0: CREG2<br>1: PREG read<br>2: CREG+IMM<br>3: PCRel?<br>3: PREG write<br>4: PC?<br>5: COND<br>8: I2C write
