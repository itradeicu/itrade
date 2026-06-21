@echo off
chcp 65001 >nul
title iTrade 一键安装程序

:: --- 颜色定义 ---
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set ESC=%%b
set "CLR_RESET=%ESC%[0m"
set "CLR_BORDER=%ESC%[1;34m"
set "CLR_TITLE=%ESC%[1;36m"
set "CLR_TEXT=%ESC%[0;37m"
set "CLR_WARN=%ESC%[1;33m"
set "CLR_SUCCESS=%ESC%[1;32m"
set "CLR_INFO=%ESC%[1;35m"
set "CLR_ERROR=%ESC%[1;31m"

cls

echo %CLR_BORDER%┌────────────────────────────────────────────────────────┐%CLR_RESET%
echo %CLR_BORDER%│%CLR_RESET%  %CLR_TITLE%🚀 iTrade 一键安装程序%CLR_RESET%                       %CLR_BORDER%│%CLR_RESET%
echo %CLR_BORDER%└────────────────────────────────────────────────────────┘%CLR_RESET%
echo %CLR_TEXT%  系统: Windows%CLR_RESET%
echo.

:: 检查是否为 Windows 系统
ver | findstr /i "Windows" >nul
if %errorlevel% neq 0 (
    echo %CLR_ERROR%❌ 非 Windows 系统！%CLR_RESET%
    echo %CLR_TEXT%请使用 Linux/macOS 专用安装脚本: install.sh%CLR_RESET%
    pause
    exit /b 1
)

echo %CLR_SUCCESS%✅ 检测到 Windows 系统%CLR_RESET%

:: 检查 Docker 是否已安装
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo %CLR_WARN%⚠️ Docker 未安装，正在打开 Docker Desktop 下载页面...%CLR_RESET%
    start "" "https://docs.docker.com/desktop/install/windows-install/"
    echo %CLR_TEXT%请安装 Docker Desktop 后重新运行此脚本%CLR_RESET%
    pause
    exit /b 1
)

for /f "delims=" %%i in ('docker --version') do set DOCKER_VER=%%i
echo %CLR_SUCCESS%✅ Docker 已安装: %DOCKER_VER%%CLR_RESET%

:: 检查 Docker Compose
docker compose version >nul 2>&1
if %errorlevel% neq 0 (
    echo %CLR_WARN%⚠️ Docker Compose 未安装！%CLR_RESET%
    echo %CLR_TEXT%请安装 Docker Desktop（包含 Compose）后重新运行%CLR_RESET%
    pause
    exit /b 1
)

for /f "delims=" %%i in ('docker compose version --short') do set COMPOSE_VER=%%i
echo %CLR_SUCCESS%✅ Docker Compose 已就绪: %COMPOSE_VER%%CLR_RESET%

:: 检查 Docker 服务是否运行
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo %CLR_WARN%⚠️ Docker 服务未运行，正在启动...%CLR_RESET%
    start "" "Docker Desktop"
    echo %CLR_TEXT%请等待 Docker Desktop 启动完成后重新运行此脚本%CLR_RESET%
    pause
    exit /b 1
)

echo %CLR_SUCCESS%✅ Docker 服务运行正常%CLR_RESET%

:: 获取最新版本（使用 PowerShell 调用 GitHub Atom Feed）
echo %CLR_INFO%🔍 正在获取最新版本...%CLR_RESET%

for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri 'https://github.com/itradeicu/itrade/releases.atom' -UseBasicParsing).Content | Select-String -Pattern 'releases/tag/([^\"'']*)' | ForEach-Object { $_.Matches.Groups[1].Value } | Select-Object -First 1"') do set TAG=%%i
for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri 'https://github.com/itradeicu/itrade/releases.atom' -UseBasicParsing).Content | Select-String -Pattern '<title>([^<]*)</title>' | Select-Object -Skip 1 -First 1 | ForEach-Object { $_.Matches.Groups[1].Value } | ForEach-Object { $_ -replace '^[vV]', '' }"') do set VERSION=%%i

if "%TAG%"=="" (
    echo %CLR_ERROR%❌ 无法获取最新版本，请检查网络%CLR_RESET%
    pause
    exit /b 1
)

echo %CLR_SUCCESS%✅ 最新版本: %TAG% (文件名: v%VERSION%)%CLR_RESET%

:: 检测系统架构
set ARCH_NAME=
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set ARCH_NAME=AMD
    echo %CLR_SUCCESS%✅ 检测到 AMD 架构%CLR_RESET%
) else if "%PROCESSOR_ARCHITECTURE%"=="ARM64" (
    set ARCH_NAME=ARM
    echo %CLR_SUCCESS%✅ 检测到 ARM 架构%CLR_RESET%
) else (
    echo %CLR_ERROR%❌ 不支持的系统架构: %PROCESSOR_ARCHITECTURE%%CLR_RESET%
    pause
    exit /b 1
)

echo %CLR_INFO%📦 将下载: iTrade-Docker-%ARCH_NAME%-v%VERSION%.tar.gz%CLR_RESET%

:: 设置安装目录为当前目录
set INSTALL_DIR=%cd%

:: 备份旧版本
set EXTRACTED_DIR=iTrade-Docker-%ARCH_NAME%-v%VERSION%
if exist "%INSTALL_DIR%\%EXTRACTED_DIR%" (
    set BACKUP_DIR=backup_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
    set BACKUP_DIR=%BACKUP_DIR: =0%
    move "%INSTALL_DIR%\%EXTRACTED_DIR%" "%INSTALL_DIR%\%BACKUP_DIR%"
    echo %CLR_SUCCESS%✅ 旧版本已备份到: %BACKUP_DIR%%CLR_RESET%
)

:: 下载文件
set PACKAGE_NAME=iTrade-Docker-%ARCH_NAME%-v%VERSION%.tar.gz
set DOWNLOAD_URL=https://github.com/itradeicu/itrade/releases/download/%TAG%/%PACKAGE_NAME%

echo %CLR_INFO%⬇️ 正在下载: %DOWNLOAD_URL%%CLR_RESET%

powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%PACKAGE_NAME%' -UseBasicParsing"

if not exist "%PACKAGE_NAME%" (
    echo %CLR_ERROR%❌ 下载失败！%CLR_RESET%
    pause
    exit /b 1
)

echo %CLR_SUCCESS%✅ 下载完成！正在解压...%CLR_RESET%

:: 解压文件（使用 7zip 或 PowerShell）
if exist "%EXTRACTED_DIR%" rd /s /q "%EXTRACTED_DIR%"

:: Windows 没有 tar，使用 PowerShell 解压 gz
powershell -Command "Expand-Archive -Path '%PACKAGE_NAME%' -DestinationPath '.' -Force" 2>nul
if %errorlevel% neq 0 (
    :: 如果是 tar.gz，需要先用 7zip
    powershell -Command "tar -xzf '%PACKAGE_NAME%'" 2>nul
)

del "%PACKAGE_NAME%"

:: 进入解压目录
cd /d "%EXTRACTED_DIR%"

:: 创建 data 目录并设置权限
if not exist "data" mkdir data
if not exist "data\.certs" mkdir data\.certs

echo %CLR_SUCCESS%✅ 安装文件已准备好%CLR_RESET%

:: 生成 .env 文件
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4 Address"') do (
    set HOST_IP=%%a
    goto :found_ip
)
:found_ip
set HOST_IP=%HOST_IP:~1%

echo HOST_IP=%HOST_IP% > .env
echo DOMAIN=localhost >> .env

:: 启动 Docker 服务
echo.
echo %CLR_BORDER%┌────────────────────────────────────────────────────────┐%CLR_RESET%
echo %CLR_BORDER%│%CLR_RESET%  %CLR_TITLE%🚀  iTrade Docker Compose 启动%CLR_RESET%                %CLR_BORDER%│%CLR_RESET%
echo %CLR_BORDER%└────────────────────────────────────────────────────────┘%CLR_RESET%
echo %CLR_BORDER%┌─────────────────── 📢 官方服务渠道 ────────────────────┐%CLR_RESET%
echo %CLR_BORDER%│%CLR_RESET%  %CLR_SUCCESS%🌐 官方网站:%CLR_RESET%  https://itrade.icu                     %CLR_BORDER%│%CLR_RESET%
echo %CLR_BORDER%│%CLR_RESET%  %CLR_SUCCESS%📖 文档中心:%CLR_RESET%  https://docs.itrade.icu                %CLR_BORDER%│%CLR_RESET%
echo %CLR_BORDER%└────────────────────────────────────────────────────────┘%CLR_RESET%
echo.

echo %CLR_BORDER%🔵 正在启动容器（请耐心等待）...%CLR_RESET%

docker compose down >nul 2>&1
docker compose up -d

if %errorlevel% equ 0 (
    echo.
    echo %CLR_SUCCESS%✅ 容器启动成功！服务已全部就绪。%CLR_RESET%
) else (
    echo.
    echo %CLR_ERROR%❌ 容器启动失败！请检查上方 Docker 日志。%CLR_RESET%
    pause
    exit /b 1
)

:: 显示安装结果
echo.
echo %CLR_SUCCESS%█████████████████████████████████████████████████████████%CLR_RESET%
echo %CLR_SUCCESS%  🎉 部署大功告成！%CLR_RESET%
echo %CLR_SUCCESS%█████████████████████████████████████████████████████████%CLR_RESET%
echo.
echo %CLR_TITLE%📦 安装信息%CLR_RESET%
echo   %CLR_TEXT%• 访问地址: %CLR_INFO%https://127.0.0.1%CLR_RESET%
echo   %CLR_TEXT%• 安装目录: %CLR_INFO%%INSTALL_DIR%\%EXTRACTED_DIR%%CLR_RESET%
echo   %CLR_TEXT%• 版本:     %CLR_INFO%v%VERSION%%CLR_RESET%
echo.
echo %CLR_TITLE%🔍 常用命令%CLR_RESET%
echo   %CLR_TEXT%• 查看日志: %CLR_INFO%docker logs -f itrade-icu%CLR_RESET%
echo   %CLR_TEXT%• 启动服务: %CLR_INFO%docker compose up -d%CLR_RESET%
echo   %CLR_TEXT%• 停止服务: %CLR_INFO%docker compose down%CLR_RESET%
echo   %CLR_TEXT%• 重启服务: %CLR_INFO%docker compose restart%CLR_RESET%
echo   %CLR_TEXT%• 卸载服务: %CLR_INFO%docker compose down ^& cd .. ^& rd /s /q %EXTRACTED_DIR%%CLR_RESET%
echo.

pause
