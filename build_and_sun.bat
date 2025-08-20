@echo off
REM ================================
REM Compilar y ejecutar con MADS y Altirra
REM ================================

REM Cambia estas rutas a las de tu instalación:
set MADS_PATH=C:\mads\bin\windows_x86_64\mads.exe
set ALTIRRA_PATH=C:\Altirra\Altirra64.exe

REM Recibimos la ruta completa del archivo fuente como parámetro
set "SOURCE_FILE=%~1"

REM Si no hay parámetro, avisamos y salimos
if "%SOURCE_FILE%"=="" (
    echo ERROR: No se especifico el archivo fuente.
    pause
    exit /b 1
)

REM Generar el archivo de salida (.xex) en la misma carpeta que el .asm
set "OUTPUT_FILE=%~dpn1.xex"

echo ===============================
echo Compilando: %SOURCE_FILE%
echo ===============================

"%MADS_PATH%" "%SOURCE_FILE%" -o:"%OUTPUT_FILE%" -t:xex

if errorlevel 1 (
    echo Error en la compilacion.
    pause
    exit /b 1
)

echo ===============================
echo Ejecutando en Altirra: %OUTPUT_FILE%
echo ===============================

"%ALTIRRA_PATH%" "%OUTPUT_FILE%"
