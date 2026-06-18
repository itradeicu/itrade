#!/bin/bash
# ==========================================
# iTrade 一键安装脚本
# 自动检测架构，从 GitHub 下载并启动
# ==========================================

set -e

# --- 颜色定义 ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=================================================${NC}"
echo -e "${GREEN}  iTrade 引擎自动化部署程序启动...              ${NC}"
echo -e "${GREEN}=================================================${NC}"

# ==========================================
# 0. 权限检查
# ==========================================
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}[错误] 请使用 sudo 或 root 权限运行此脚本！${NC}"
  echo "示例: sudo bash install.sh"
  exit 1
fi

# ==========================================
# 1. 检查并安装 Docker & Docker Compose
# ==========================================
echo -e "\n${YELLOW}=> [1/5] 检查 Docker 运行环境...${NC}"

if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}未检测到 Docker，正在为您自动安装官网最新版...${NC}"
    curl -fsSL https://get.docker.com | bash
    systemctl enable --now docker
    echo -e "${GREEN}Docker 安装并启动成功！${NC}"
else
    echo -e "${GREEN}Docker 已安装: $(docker --version)${NC}"
fi

if ! docker compose version &> /dev/null; then
    echo -e "${RED}[错误] Docker Compose 插件未安装或损坏${NC}"
    exit 1
else
    echo -e "${GREEN}Docker Compose 已就绪: $(docker compose version)${NC}"
fi

# ==========================================
# 2. 自动识别系统架构
# ==========================================
echo -e "\n${YELLOW}=> [2/5] 正在检测系统架构...${NC}"

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    ARCH_NAME="X64"
    echo -e "${GREEN}✅ 检测到 X86_64 架构${NC}"
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    ARCH_NAME="ARM64"
    echo -e "${GREEN}✅ 检测到 ARM64 架构${NC}"
else
    echo -e "${RED}❌ 暂不支持的系统架构: $ARCH${NC}"
    exit 1
fi

echo -e "${GREEN}将下载: iTrade-Docker-${ARCH_NAME}.zip${NC}"

# ==========================================
# 3. 获取最新版本号
# ==========================================
echo -e "\n${YELLOW}=> [3/5] 获取最新版本...${NC}"

VERSION=$(curl -s https://api.github.com/repos/itradeicu/itrade/releases/latest | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4)

if [ -z "$VERSION" ]; then
    echo -e "${RED}[错误] 无法获取最新版本，请检查网络连接${NC}"
    exit 1
fi

echo -e "${GREEN}最新版本: ${VERSION}${NC}"

# ==========================================
# 4. 下载并解压
# ==========================================
echo -e "\n${YELLOW}=> [4/5] 下载 iTrade ${VERSION}...${NC}"

DOWNLOAD_URL="https://github.com/itradeicu/itrade/releases/download/${VERSION}/iTrade-Docker-${ARCH_NAME}.zip"
PACKAGE_NAME="iTrade-Docker-${ARCH_NAME}.zip"

# 创建临时目录
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo -e "下载地址: ${DOWNLOAD_URL}"
echo -e "正在下载... (请耐心等待)"

curl -L -o "$PACKAGE_NAME" "$DOWNLOAD_URL"

if [ ! -f "$PACKAGE_NAME" ] || [ ! -s "$PACKAGE_NAME" ]; then
    echo -e "${RED}[错误] 下载失败${NC}"
    exit 1
fi

echo -e "${GREEN}下载完成！正在解压...${NC}"

# 解压
unzip -o "$PACKAGE_NAME"

# 切换到解压目录
EXTRACTED_DIR=$(find . -maxdepth 1 -type d -name "iTrade-*" | head -1)
if [ -z "$EXTRACTED_DIR" ]; then
    echo -e "${RED}[错误] 解压失败，未找到目录${NC}"
    exit 1
fi

cd "$EXTRACTED_DIR"

echo -e "${GREEN}安装文件已准备好！${NC}"

# ==========================================
# 5. 启动服务
# ==========================================
echo -e "\n${YELLOW}=> [5/5] 启动 Docker 服务...${NC}"

# 创建数据目录
mkdir -p data

# 自动生成 .env 文件设置宿主机 IP
HOST_IP=$(hostname -I | awk '{print $1}')
echo "HOST_IP=$HOST_IP" > .env

# 启动服务
docker compose up -d

# 清理临时目录
rm -rf "$TEMP_DIR"

echo -e "\n${GREEN}=================================================${NC}"
echo -e "${GREEN}  🎉 部署大功告成！${NC}"
echo -e "${GREEN}=================================================${NC}"
echo -e "访问地址: ${YELLOW}https://${HOST_IP}/zh-CN/login${NC}"
echo -e ""
echo -e "常用命令:"
echo -e "  查看日志: ${YELLOW}docker logs -f itrade-icu${NC}"
echo -e "  停止服务: ${YELLOW}docker compose down${NC}"
echo -e "  重启服务: ${YELLOW}docker compose restart${NC}"
