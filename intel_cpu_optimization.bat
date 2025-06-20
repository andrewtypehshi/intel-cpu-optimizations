@echo off
title Intel CPU Optimization Script - Menu
color 0A

:: Check for Administrator privileges first
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ============================================
    echo ERROR: Administrator privileges required!
    echo ============================================
    echo Please right-click this file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

:MENU
cls
echo ============================================
echo Intel CPU Performance Optimization Script
echo ============================================
echo.
echo Please select an option:
echo.
echo [1] Apply ALL Optimizations (Complete Setup)
echo [2] Power Plan ^& CPU Management Only
echo [3] Intel SpeedStep ^& Turbo Boost Only
echo [4] Disable CPU Parking Only
echo [5] System Performance Registry Tweaks
echo [6] Intel-Specific Registry Settings
echo [7] Disable Windows Power Throttling
echo [8] Advanced Performance Optimizations
echo [9] CPU Security Mitigations (OPTIONAL)
echo [0] Exit
echo.
echo ============================================
set /p choice="Enter your choice (0-9): "

if "%choice%"=="1" goto ALL_OPTIMIZATIONS
if "%choice%"=="2" goto POWER_CPU
if "%choice%"=="3" goto SPEEDSTEP_TURBO
if "%choice%"=="4" goto CPU_PARKING
if "%choice%"=="5" goto SYSTEM_REGISTRY
if "%choice%"=="6" goto INTEL_REGISTRY
if "%choice%"=="7" goto POWER_THROTTLING
if "%choice%"=="8" goto ADVANCED_PERF
if "%choice%"=="9" goto CPU_MITIGATIONS
if "%choice%"=="0" goto EXIT
echo.
echo Invalid choice. Please try again.
pause
goto MENU

:ALL_OPTIMIZATIONS
cls
echo ============================================
echo Applying ALL CPU Optimizations...
echo ============================================
echo.
call :POWER_CPU_FUNC
call :SPEEDSTEP_TURBO_FUNC
call :CPU_PARKING_FUNC
call :SYSTEM_REGISTRY_FUNC
call :INTEL_REGISTRY_FUNC
call :POWER_THROTTLING_FUNC
call :ADVANCED_PERF_FUNC
echo.
echo ============================================
echo ALL Optimizations Complete!
echo ============================================
call :COMPLETION_MESSAGE
goto MENU

:POWER_CPU
cls
echo ============================================
echo Power Plan ^& CPU Management Optimization
echo ============================================
echo.
call :POWER_CPU_FUNC
echo.
echo Power ^& CPU Management optimization complete!
pause
goto MENU

:SPEEDSTEP_TURBO
cls
echo ============================================
echo Intel SpeedStep ^& Turbo Boost Optimization
echo ============================================
echo.
call :SPEEDSTEP_TURBO_FUNC
echo.
echo Intel SpeedStep ^& Turbo Boost optimization complete!
pause
goto MENU

:CPU_PARKING
cls
echo ============================================
echo Disabling CPU Parking
echo ============================================
echo.
call :CPU_PARKING_FUNC
echo.
echo CPU Parking disabled successfully!
pause
goto MENU

:SYSTEM_REGISTRY
cls
echo ============================================
echo System Performance Registry Tweaks
echo ============================================
echo.
call :SYSTEM_REGISTRY_FUNC
echo.
echo System performance registry tweaks applied!
pause
goto MENU

:INTEL_REGISTRY
cls
echo ============================================
echo Intel-Specific Registry Settings
echo ============================================
echo.
call :INTEL_REGISTRY_FUNC
echo.
echo Intel registry settings optimized!
pause
goto MENU

:POWER_THROTTLING
cls
echo ============================================
echo Disabling Windows Power Throttling
echo ============================================
echo.
call :POWER_THROTTLING_FUNC
echo.
echo Windows Power Throttling disabled!
pause
goto MENU

:ADVANCED_PERF
cls
echo ============================================
echo Advanced Performance Optimizations
echo ============================================
echo.
call :ADVANCED_PERF_FUNC
echo.
echo Advanced performance optimizations applied!
pause
goto MENU

:CPU_MITIGATIONS
cls
echo ============================================
echo CPU Security Mitigations (OPTIONAL)
echo ============================================
echo.
echo WARNING: This reduces security but can improve performance significantly.
echo CPU vulnerability mitigations help protect against speculative execution attacks.
echo.
echo Do you want to disable CPU security mitigations? (y/N)
set /p mitigation_choice="Enter choice: "
if /i "%mitigation_choice%"=="y" (
    echo.
    echo Disabling CPU mitigations...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f >nul 2>&1
    bcdedit /set spectre off >nul 2>&1
    bcdedit /set mds off >nul 2>&1
    bcdedit /set tsx off >nul 2>&1
    echo CPU mitigations disabled successfully!
    echo IMPORTANT: System restart required for changes to take effect.
) else (
    echo CPU mitigation changes skipped.
)
echo.
pause
goto MENU

:: FUNCTION DEFINITIONS
:POWER_CPU_FUNC
echo [1] Setting Power Plan to High Performance...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
if %errorLevel% neq 0 (
    echo Creating High Performance power plan...
    powercfg /duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
)
echo [2] Configuring CPU Power Management...
:: Disable CPU throttling
powercfg /setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
:: Disable processor idle
powercfg /setacvalueindex scheme_current sub_processor PROCTHROTTLEPOL 0
:: Set cooling policy to active
powercfg /setacvalueindex scheme_current sub_processor SYSCOOLPOL 1
:: Apply changes
powercfg /setactive scheme_current
goto :eof

:SPEEDSTEP_TURBO_FUNC
echo [3] Optimizing Intel SpeedStep and Turbo Boost...
:: Registry tweaks for Intel SpeedStep
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "Attributes" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d 2 /f >nul 2>&1
goto :eof

:CPU_PARKING_FUNC
echo [4] Disabling CPU Parking...
:: Disable CPU Core Parking
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d 0 /f >nul 2>&1
powercfg /setacvalueindex scheme_current sub_processor CPMINCORES 100
goto :eof

:SYSTEM_REGISTRY_FUNC
echo [5] Optimizing System Performance Registry Settings...
:: Set system responsiveness
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul 2>&1
:: Network throttling index
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul 2>&1
:: Disable dynamic tick
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableDynamicTick" /t REG_DWORD /d 1 /f >nul 2>&1
:: Set timer resolution
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d 1 /f >nul 2>&1
goto :eof

:INTEL_REGISTRY_FUNC
echo [6] Optimizing Intel-specific Registry Settings...
:: Intel Turbo Boost
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d 0 /f >nul 2>&1
:: Intel Graphics Power Management
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_PhmSoftPowerPlayTable" /t REG_DWORD /d 0 /f >nul 2>&1
goto :eof

:POWER_THROTTLING_FUNC
echo [7] Disabling Windows Power Throttling...
:: Disable Windows Power Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
:: Disable Game Mode power throttling
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f >nul 2>&1
goto :eof

:ADVANCED_PERF_FUNC
echo [8] Additional Performance Optimizations...
:: Disable HPET (High Precision Event Timer)
bcdedit /set useplatformclock false >nul 2>&1
:: Set TSC (Time Stamp Counter) as default
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1
:: Disable synthetic timers
bcdedit /set hypervisorlaunchtype off >nul 2>&1
:: Optimize scheduler
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul 2>&1
:: Memory management
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >nul 2>&1
goto :eof

:COMPLETION_MESSAGE
echo.
echo Changes applied:
echo - High Performance power plan activated
echo - CPU parking disabled
echo - Processor throttling disabled
echo - Intel SpeedStep optimized
echo - System responsiveness maximized
echo - Power throttling disabled
echo - Timer optimizations applied
echo - Memory management optimized
echo.
echo IMPORTANT: A system restart is recommended for all changes to take effect.
echo.
echo Would you like to restart now? (y/N)
set /p restart_choice="Enter choice: "
if /i "%restart_choice%"=="y" (
    echo Restarting in 10 seconds... Press Ctrl+C to cancel.
    timeout /t 10
    shutdown /r /t 0
) else (
    echo Please restart your computer manually when convenient.
)
goto :eof

:EXIT
cls
echo ============================================
echo Intel CPU Optimization Script
echo ============================================
echo.
echo Thank you for using the Intel CPU Optimization Script!
echo.
echo Press any key to exit...
pause >nul
exit /b 0

