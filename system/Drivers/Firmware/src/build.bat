@echo off
echo Cleaning now...
del /Q *.o *.d 2>nul
echo Compiling now...
for %%f in (*.c) do (
    echo Compiling %%f
     call "..\\..\\..\\..\\..\\..\\..\\tools\\xpack-arm-none-eabi-gcc\\14.2.1-1.1/bin/arm-none-eabi-gcc" ^
        -mthumb -MMD -fno-exceptions -Wall -Wextra -Os -Werror=return-type ^
        -mcpu=cortex-m4 -DF_CPU=80000000L -DARDUINO=10815 -DARDUINO_AT32F415CBT7 ^
        -DARDUINO_ARCH_AT32F -DARDUINO_BOARD=AT32F415CBT7 -DARDUINO_VARIANT=AT32F415CBT7 ^
        -DF_PLL_CLOCK_SOURCE=0 -DF_PLL_MULT=CRM_PLL_MULT_60 -DF_HSI_DIV=CRM_HICK48_DIV6 ^
        -DAT32F415CBT7 -DUSE_STDPERIPH_DRIVER -I "..\\..\\CMSIS/Include" ^
        -I "..\\..\\..\\AT32F415" -I "..\\inc" -I "..\\..\\..\\libcore" ^
        -I "..\\..\\..\\libcore/config" -I "..\\..\\..\\..\\cores\\arduino" ^
        -I "..\\..\\..\\..\\variants\\AT32F415CBT7" ^
        -c %%f -o %%~nf.o
)
echo Archiving now...
call "..\\..\\..\\..\\..\\..\\..\\tools\\xpack-arm-none-eabi-gcc\\14.2.1-1.1/bin/arm-none-eabi-ar" rcs ^
    "..\\..\\..\\..\\variants\\AT32F415CBT7\\FrameLib.a" *.o
echo Cleaning now...
del /Q *.o *.d 2>nul
echo Done.