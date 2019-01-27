set path=D:\Dropbox\Privat\2019-01-27_ULP_Complier\esp32ulp-elf-binutils\bin

REM esp32ulp-elf-as.exe -Wa -al -g test.S
REM esp32ulp-elf-as.exe -al -g test2.S
esp32ulp-elf-as.exe -acdhlns test2.S
