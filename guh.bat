@echo off
echo Building Optimized RCKangaroo for RTX 4080 Super...

:: Compile with NVCC directly, skipping the Linux Makefile
:: -arch=sm_89 targets the 4080 Super (Ada Lovelace)
:: -use_fast_math speeds up the integer modulo math
nvcc -o RCKangaroo_Fast.exe RCKangaroo.cpp GpuKang.cpp Ec.cpp utils.cpp RCGpuCore.cu -O3 -arch=sm_89 -use_fast_math -Xptxas -O3 -D_WIN32

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [SUCCESS] Created RCKangaroo_Fast.exe
    echo Run this new file for higher speeds!
) else (
    echo.
    echo [ERROR] Compilation failed. Make sure you are running this
    echo from the "x64 Native Tools Command Prompt for VS 2022"
)
pause