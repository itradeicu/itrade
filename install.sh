#!/bin/bash
# ==========================================
# iTrade 一键安装脚本
# 自动检测操作系统和架构，从 GitHub 下载并启动
# ==========================================

set -e

CLR_RESET="\033[0m"
CLR_BORDER="\033[1;34m"
CLR_TITLE="\033[1;36m"
CLR_TEXT="\033[0;37m"
CLR_WARN="\033[1;33m"
CLR_SUCCESS="\033[1;32m"
CLR_INFO="\033[1;35m"
CLR_ERROR="\033[1;31m"

OS_TYPE=$(uname -s)
ARCH=$(uname -m)
INSTALL_DIR=$(pwd)
ARCH_NAME=""
VERSION=""

# ==========================================
# 函数：检查操作系统
# ==========================================
check_os() {
    case "$OS_TYPE" in
        Linux)
            echo -e "${CLR_SUCCESS}✅ 检测到 Linux 系统${CLR_RESET}"
            return 0
            ;;
        Darwin)
            echo -e "${CLR_SUCCESS}✅ 检测到 macOS 系统${CLR_RESET}"
            return 0
            ;;
        *)
            echo -e "${CLR_ERROR}❌ 检测到非类 Unix 系统 (${OS_TYPE})${CLR_RESET}"
            echo -e "${CLR_TEXT}请使用 Windows 专用安装脚本: install.bat${CLR_RESET}"
            echo -e "${CLR_TEXT}下载地址: https://github.com/itradeicu/itrade/releases/download/latest/install.bat${CLR_RESET}"
            exit 1
            ;;
    esac
}

# ==========================================
# 函数：检查权限
# ==========================================
check_permission() {
    if [ "$EUID" -ne 0 ]; then
        echo -e "${CLR_ERROR}❌ 请使用 sudo 或 root 权限运行此脚本！${CLR_RESET}"
        echo "示例: sudo bash install.sh"
        exit 1
    fi
    echo -e "${CLR_SUCCESS}✅ 权限检查通过${CLR_RESET}"
}

# ==========================================
# 函数：检查并安装 tar
# ==========================================
check_and_install_tar() {
    if command -v tar &> /dev/null; then
        echo -e "${CLR_SUCCESS}✅ tar 已安装${CLR_RESET}"
        return 0
    fi

    echo -e "${CLR_INFO}⬇️ 正在安装 tar...${CLR_RESET}"
    if [ -f /etc/debian_version ]; then
        apt-get update && apt-get install -y tar
    elif [ -f /etc/redhat-release ]; then
        yum install -y tar
    elif command -v apk &> /dev/null; then
        apk add tar
    else
        echo -e "${CLR_ERROR}❌ 无法确定包管理器，请手动安装 tar${CLR_RESET}"
        exit 1
    fi
    echo -e "${CLR_SUCCESS}✅ tar 安装完成${CLR_RESET}"
}

# ==========================================
# 函数：检查并安装 Docker
# ==========================================
check_and_install_docker() {
    if command -v docker &> /dev/null; then
        echo -e "${CLR_SUCCESS}✅ Docker 已安装: $(docker --version)${CLR_RESET}"
        return 0
    fi

    echo -e "${CLR_INFO}⬇️ 未检测到 Docker，正在自动安装...${CLR_RESET}"

    if [ "$OS_TYPE" == "Darwin" ]; then
        echo -e "${CLR_ERROR}❌ macOS 需要手动安装 Docker Desktop${CLR_RESET}"
        echo -e "${CLR_TEXT}下载地址: https://docs.docker.com/desktop/install/mac-install/${CLR_RESET}"
        exit 1
    fi

    curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
    sh /tmp/get-docker.sh
    rm /tmp/get-docker.sh

    systemctl enable --now docker
    echo -e "${CLR_SUCCESS}✅ Docker 安装成功！${CLR_RESET}"
}

# ==========================================
# 函数：检查 Docker Compose
# ==========================================
check_docker_compose() {
    if docker compose version &> /dev/null; then
        echo -e "${CLR_SUCCESS}✅ Docker Compose 已就绪: $(docker compose version --short)${CLR_RESET}"
        return 0
    fi

    echo -e "${CLR_WARN}⚠️ Docker Compose 未安装，正在安装...${CLR_RESET}"

    if [ "$OS_TYPE" == "Linux" ]; then
        if [ -f /etc/debian_version ]; then
            apt-get update && apt-get install -y docker-compose-plugin
        elif [ -f /etc/redhat-release ]; then
            yum install -y docker-compose-plugin
        elif command -v apk &> /dev/null; then
            apk add docker-compose-plugin
        else
            echo -e "${CLR_ERROR}❌ 无法确定包管理器${CLR_RESET}"
            exit 1
        fi
        echo -e "${CLR_SUCCESS}✅ Docker Compose 安装完成${CLR_RESET}"
    else
        echo -e "${CLR_ERROR}❌ 请先安装 Docker Desktop${CLR_RESET}"
        exit 1
    fi
}

# ==========================================
# 函数：检查 Docker 服务
# ==========================================
check_docker_service() {
    if docker info &> /dev/null; then
        echo -e "${CLR_SUCCESS}✅ Docker 服务运行正常${CLR_RESET}"
        return 0
    fi

    echo -e "${CLR_WARN}⚠️ Docker 服务未运行，正在启动...${CLR_RESET}"

    if [ "$OS_TYPE" == "Linux" ]; then
        systemctl start docker
        sleep 3
        if docker info &> /dev/null; then
            echo -e "${CLR_SUCCESS}✅ Docker 服务已启动${CLR_RESET}"
        else
            echo -e "${CLR_ERROR}❌ Docker 服务启动失败${CLR_RESET}"
            exit 1
        fi
    else
        echo -e "${CLR_ERROR}❌ 请手动启动 Docker Desktop${CLR_RESET}"
        exit 1
    fi
}

# ==========================================
# 函数：获取最新版本（使用 GitHub Atom Feed，无速率限制）
# ==========================================
get_latest_version() {
    # 使用 GitHub Atom Feed 获取最新版本（无 API 速率限制）
    
    # 从 link 中提取完整的 TAG（用于下载路径，包括可能存在的点）
    TAG=$(curl -sL "https://github.com/itradeicu/itrade/releases.atom" | grep -o 'href="https://github.com/itradeicu/itrade/releases/tag/[^"]*"' | head -1 | sed 's/href="https:\/\/github.com\/itradeicu\/itrade\/releases\/tag\/\([^"]*\)".*/\1/')

    # 从 title 中提取纯版本号（用于文件名，不含特殊字符）
    VERSION=$(curl -sL "https://github.com/itradeicu/itrade/releases.atom" | grep -o '<title>[^<]*</title>' | head -2 | tail -1 | sed 's/<title>\(.*\)<\/title>/\1/' | sed 's/^v//' | sed 's/^V//')

    if [ -z "$TAG" ] || [ -z "$VERSION" ]; then
        echo -e "${CLR_ERROR}❌ 无法获取最新版本，请检查网络${CLR_RESET}"
        exit 1
    fi

    echo -e "${CLR_SUCCESS}✅ 最新版本: ${TAG} (文件名: v${VERSION})${CLR_RESET}"
}

# ==========================================
# 函数：检测系统架构
# ==========================================
detect_architecture() {
    if [ "$ARCH" = "x86_64" ]; then
        ARCH_NAME="AMD"
        echo -e "${CLR_SUCCESS}✅ 检测到 AMD 架构${CLR_RESET}"
    elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
        ARCH_NAME="ARM"
        echo -e "${CLR_SUCCESS}✅ 检测到 ARM 架构${CLR_RESET}"
    else
        echo -e "${CLR_ERROR}❌ 不支持的系统架构: $ARCH${CLR_RESET}"
        exit 1
    fi
    echo -e "${CLR_INFO}📦 将下载: iTrade-Docker-${ARCH_NAME}-v${VERSION}.tar.gz${CLR_RESET}"
}

# ==========================================
# 函数：备份旧版本
# ==========================================
backup_old_version() {
    if [ -d "$INSTALL_DIR/iTrade-Docker-${ARCH_NAME}-v${VERSION}" ]; then
        BACKUP_DIR="${INSTALL_DIR}/backup_$(date +%Y%m%d_%H%M%S)"
        mv "$INSTALL_DIR/iTrade-Docker-${ARCH_NAME}-v${VERSION}" "$BACKUP_DIR"
        echo -e "${CLR_SUCCESS}✅ 旧版本已备份到: $BACKUP_DIR${CLR_RESET}"
    fi
}

# ==========================================
# 函数：下载并解压
# ==========================================
download_and_extract() {
    PACKAGE_NAME="iTrade-Docker-${ARCH_NAME}-v${VERSION}.tar.gz"
    # 使用完整的 TAG（包括可能存在的点，如 v.1.0.4）
    DOWNLOAD_URL="https://github.com/itradeicu/itrade/releases/download/${TAG}/${PACKAGE_NAME}"
    EXTRACTED_DIR="iTrade-Docker-${ARCH_NAME}-v${VERSION}"

    mkdir -p "$INSTALL_DIR"
    cd "$INSTALL_DIR"

    echo -e "${CLR_INFO}⬇️ 正在下载: ${DOWNLOAD_URL}${CLR_RESET}"
    curl -fL -o "$PACKAGE_NAME" "$DOWNLOAD_URL"

    if [ ! -f "$PACKAGE_NAME" ] || [ ! -s "$PACKAGE_NAME" ]; then
        echo -e "${CLR_ERROR}❌ 下载失败，请检查 Release 是否存在此架构包${CLR_RESET}"
        exit 1
    fi

    echo -e "${CLR_SUCCESS}✅ 下载完成！正在解压...${CLR_RESET}"

    rm -rf "$EXTRACTED_DIR"
    tar -xzf "$PACKAGE_NAME"
    rm -f "$PACKAGE_NAME"

    cd "$EXTRACTED_DIR"
    mkdir -p data
    chmod 777 data

    if [ "$OS_TYPE" == "Darwin" ]; then
        HOST_IP=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')
    else
        HOST_IP=$(hostname -I | awk '{print $1}')
    fi
    echo "HOST_IP=$HOST_IP" > .env
    echo "DOMAIN=localhost" >> .env

    echo -e "${CLR_SUCCESS}✅ 安装文件已准备好${CLR_RESET}"
}

# ==========================================
# 函数：启动 Docker 服务
# ==========================================
start_docker_services() {
    echo -e "\n${CLR_BORDER}┌────────────────────────────────────────────────────────┐${CLR_RESET}"
    echo -e "${CLR_BORDER}│${CLR_RESET}  ${CLR_TITLE}🚀  iTrade Docker Compose 启动${CLR_RESET}                ${CLR_BORDER}│${CLR_RESET}"
    echo -e "${CLR_BORDER}├─────────────────── 📢 官方服务渠道 ────────────────────┤${CLR_RESET}"
    echo -e "${CLR_BORDER}│${CLR_RESET}  ${CLR_SUCCESS}🌐 官方网站:${CLR_RESET}  https://itrade.icu                     ${CLR_BORDER}│${CLR_RESET}"
    echo -e "${CLR_BORDER}│${CLR_RESET}  ${CLR_SUCCESS}📖 文档中心:${CLR_RESET}  https://docs.itrade.icu                ${CLR_BORDER}│${CLR_RESET}"
    echo -e "${CLR_BORDER}└────────────────────────────────────────────────────────┘${CLR_RESET}"
    echo ""

    echo -e "${CLR_BORDER}🔵 正在下载依赖并启动容器（请耐心等待预计3-10分钟取决于网速）...${CLR_RESET}"
    
    # 进入安装目录执行 docker compose
    cd "${INSTALL_DIR}/iTrade-Docker-${ARCH_NAME}-v${VERSION}"
    docker compose up -d

    if [ $? -eq 0 ]; then
        echo -e "\n${CLR_SUCCESS}✅ 容器启动成功！服务已全部就绪。${CLR_RESET}"
        return 0
    else
        echo -e "\n${CLR_ERROR}❌ 容器启动失败！请检查上方 Docker 日志。${CLR_RESET}"
        exit 1
    fi
}

# ==========================================
# 函数：显示安装结果
# ==========================================
show_install_result() {
    if [ "$OS_TYPE" == "Darwin" ]; then
        HOST_IP=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')
    else
        HOST_IP=$(hostname -I | awk '{print $1}')
    fi

    echo -e "\n${CLR_SUCCESS}█████████████████████████████████████████████████████████${CLR_RESET}"
    echo -e "${CLR_SUCCESS}  🎉 部署大功告成！${CLR_RESET}"
    echo -e "${CLR_SUCCESS}█████████████████████████████████████████████████████████${CLR_RESET}"
    echo -e ""
    echo -e "${CLR_TITLE}📦 安装信息${CLR_RESET}"
    echo -e "  ${CLR_TEXT}• 访问地址: ${CLR_INFO}https://127.0.0.1"
    echo -e "  ${CLR_TEXT}• 安装目录: ${CLR_INFO}${INSTALL_DIR}/iTrade-Docker-${ARCH_NAME}-v${VERSION}${CLR_RESET}"
    echo -e "  ${CLR_TEXT}• 版本:     ${CLR_INFO}v${VERSION}${CLR_RESET}"
    echo -e ""
    echo -e "${CLR_TITLE}🔍 常用命令${CLR_RESET}"
    echo -e "  ${CLR_TEXT}• 查看日志: sudo ${CLR_INFO}docker logs -f itrade-icu${CLR_RESET}"
    echo -e "  ${CLR_TEXT}• 启动服务: sudo ${CLR_INFO}docker compose up -d${CLR_RESET}"
    echo -e "  ${CLR_TEXT}• 停止服务: sudo ${CLR_INFO}docker compose down${CLR_RESET}"
    echo -e "  ${CLR_TEXT}• 重启服务: sudo ${CLR_INFO}docker compose restart${CLR_RESET}"
    echo -e "  ${CLR_TEXT}• 卸载服务: sudo ${CLR_INFO}docker compose down && cd .. && rm -rf iTrade-Docker-${ARCH_NAME}-v${VERSION}${CLR_RESET}"
    echo -e ""
}

# ==========================================
# 主函数：按顺序执行所有步骤
# ==========================================
main() {
    clear

    echo -e "${CLR_BORDER}┌────────────────────────────────────────────────────────┐${CLR_RESET}"
    echo -e "${CLR_BORDER}│${CLR_RESET}  ${CLR_TITLE}🚀 iTrade 一键安装程序${CLR_RESET}                       ${CLR_BORDER}│${CLR_RESET}"
    echo -e "${CLR_BORDER}└────────────────────────────────────────────────────────┘${CLR_RESET}"
    echo -e "${CLR_TEXT}  系统: ${OS_TYPE} ${ARCH}${CLR_RESET}"
    echo -e ""

    check_os
    check_permission
    check_and_install_tar
    check_and_install_docker
    check_docker_compose
    check_docker_service
    get_latest_version
    detect_architecture
    backup_old_version
    download_and_extract
    start_docker_services
    show_install_result

    # 切换到安装目录
    cd "${INSTALL_DIR}/iTrade-Docker-${ARCH_NAME}-v${VERSION}"
}

main "$@"
