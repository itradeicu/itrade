# iTrade ICU 量化交易系统

> 🌐 **语言切换**：[English](./README.md) · [简体中文](./README_zh-CN.md) · [繁體中文](./README_zh-TW.md) · [日本語](./README_ja.md) · [한국어](./README_ko.md) · [Français](./README_fr.md)

> 🔗 **快速链接**：[🌐 官网](https://itrade.icu) · [📖 文档](https://docs.itrade.icu) · [🐛 问题反馈](https://github.com/itradeicu/itrade.icu/issues)

---



## 📖 项目介绍

iTrade 是一个企业级量化交易系统客户端，为专业交易者和量化团队设计。系统集成了多种成熟的量化策略、安全加密机制和实时市场监控功能，支持主流 110+ 交易所的自动化交易。

- 🌐 官网：[https://itrade.icu](https://itrade.icu)
- 📖 文档：[https://docs.itrade.icu](https://docs.itrade.icu)

---


## 🚀 一键安装

iTrade 提供跨平台的一键安装脚本，支持 **Linux / macOS / Windows** 全平台，**自动检测系统架构**（AMD/ARM），**自动从 GitHub 获取最新版本**。

<!-- TABS_START -->

### 🐧 Linux / 🍎 macOS

打开终端，执行以下命令即可一键下载、安装并启动：

```bash
curl -fsSL https://raw.githubusercontent.com/itradeicu/itrade/main/install.sh | bash
```

> 💡 **提示**：
> - 需要 `sudo` 权限（首次运行 Docker 安装）
> - 自动适配 `x86_64` (AMD) 和 `aarch64/arm64` (ARM) 架构
> - 自动从 [GitHub Releases](https://github.com/itradeicu/itrade/releases) 获取最新版本

### 🪟 Windows

**方式一：PowerShell 远程执行（推荐）**

以管理员身份打开 PowerShell，执行：

```powershell
irm https://raw.githubusercontent.com/itradeicu/itrade/main/install.bat | cmd
```

**方式二：手动下载**

1. 下载安装脚本：[install.bat](https://github.com/itradeicu/itrade/releases/latest/download/install.bat)
2. 右键 → **以管理员身份运行**

> 💡 **提示**：
> - 需要先安装 [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)
> - 自动适配 `AMD64` 和 `ARM64` 架构

<!-- TABS_END -->

### 📋 安装流程说明

| 步骤 | 说明 |
|------|------|
| 1️⃣ 环境检查 | 自动检测 Docker / Docker Compose 是否就绪 |
| 2️⃣ 版本获取 | 从 GitHub Atom Feed 获取最新版本（无速率限制） |
| 3️⃣ 架构识别 | 自动判断 AMD / ARM 架构 |
| 4️⃣ 旧版备份 | 备份旧版本到 `backup_YYYYMMDD_HHMMSS` 目录 |
| 5️⃣ 下载解压 | 下载对应架构的 Docker 镜像包 |
| 6️⃣ 启动服务 | 自动启动 Docker Compose 容器 |
| 7️⃣ 自动打开 | 安装完成后，浏览器访问 `https://127.0.0.1` |

---


## ⭐ 核心功能模块

### 📈 网格交易 - 震荡行情赚钱利器

价格来回波动的时候最赚钱。自动在区间内低买高卖，不用你管。

- ✅ 现货和合约都支持
- ✅ 可以做多、做空、双向同时挂单
- ✅ 马丁格尔策略：越跌越买，拉降低成本
- ✅ 四种风控模式：设止盈止损价、按收益率自动停，随你选

### 💰 资金费率套利 - 躺着赚费率

永续合约每 8 小时结算一次资金费率，这个功能就是专门赚这个钱的。

- ✅ 费率正就开空，费率负就开多，拿了费率就溜
- ✅ 时间卡得死死的，一秒都不会错过
- ✅ 平仓时绝对不会反向开仓，安全感拉满

### 📊 刷量 - 快速增加交易量

需要某个交易对看起来活跃？用它。

- ✅ 限价单、市价单都能刷
- ✅ 会模拟真人交易：下单金额随机、持仓时间随机、休息时间也随机
- ✅ 设个目标成交量，刷够了自动停，不浪费钱

### 🔄 定投 DCA - 分批买币不亏钱

别一次性 all in，分批买更稳。

- ✅ CEX 和 DEX 都支持
- ✅ 按分钟、小时、日、月定投，想怎么定怎么定
- ✅ 还能循环定投：隔几秒买一次
- ✅ 可以设最大次数，买够了自动停

### 👀 行情监控 - 24 小时盯盘助手

你睡觉，它帮你盯着。

- ✅ 多个交易所同时监控
- ✅ 链上地址变化也能监控
- ✅ 钉钉、Telegram、Discord、Webhook，哪里都能通知你

### 🔔 TradingView Webhook - 信号自动交易

TradingView 发信号，系统自动买卖。

- ✅ 支持现货和合约交易
- ✅ 安全码验证，防止伪造请求
- ✅ 支持 110+ 交易所 Webhook 接入
- ✅ 所有请求完整日志追踪

**使用方式**：
1. 在系统配置页面创建 Webhook Token
2. 将 Token 添加到 TradingView Alert 设置
3. TradingView 触发信号时，系统自动执行交易

### 🔍 币种分析 - 智能选币助手

不知道选什么币？让它帮你筛。

**CEX 币种筛选**：
- ✅ 全市场 24h 数据扫描
- ✅ 按成交量、涨跌幅、市值筛选
- ✅ 支持多维度排序
- ✅ 实时更新，不错过热点

**DEX 热门币种**：
- ✅ 链上热门币种追踪
- ✅ 支持多链筛选（ETH、BSC、SOL 等）
- ✅ 新币发现，第一时间上车
- ✅ 市值、时间范围自定义

### 📢 多渠道推送 - 消息触达全覆盖

重要事件发生，第一时间通知你。

- ✅ Telegram 推送
- ✅ Discord 推送
- ✅ 钉钉推送
- ✅ 飞书推送
- ✅ 微信推送
- ✅ 自定义 Webhook

---

## 💻 支持系统

| 系统 | 版本 | 架构 |
|------|------|------|
| 🐧 Linux | Ubuntu 20.04+ / Debian 11+ / CentOS 8+ | AMD64 / ARM64 |
| 🍎 macOS | macOS 11 (Big Sur) 及以上 | Intel / Apple Silicon |
| 🪟 Windows | Windows 10/11 (64-bit) | AMD64 / ARM64 |

---

## 🔐 安全这块你放心

你的钱和密钥，我比你自己还上心：

### 🛡️ 数据传输加密
ECDH 密钥协商 + AES-256 加密，银行级别的。定时自动无痛更换。

### 🔑 API 密钥加密存储
你的交易所密钥绝不明文存储，AES-256 加密后再存。

而且用了 HKDF 密钥派生技术，每个场景用不同的子密钥。每个人的加密结果都不一样，就算两个人的数据一模一样，加密后也完全不同。

> 💡 **数据库泄露了？攻击者也拿不到你的密钥。**

### 🏠 数据安全
所有数据存储在用户侧，承诺绝不上传用户私钥/密钥等敏感信息。

---

## 🔧 常用运维命令

安装完成后，可使用以下命令管理服务：

```bash
# 查看运行日志
docker logs -f itrade-icu

# 启动服务
docker compose up -d

# 停止服务
docker compose down

# 重启服务
docker compose restart

# 卸载服务（删除容器和文件）
docker compose down && cd .. && rm -rf iTrade-Docker-ARM-v1.0.4
```

---

## 🔮 未来会有啥

- **链上自动交易**：智能合约交互、MEV、跨链套利，区块链上的全自动交易
- 更多交易所和策略
- 更多需求 [GitHub Issues](https://github.com/itradeicu/itrade.icu/issues)

---

## ⚠️ 说真的，有风险

量化交易不是稳赚的：

- 🧪 先用模拟盘测，稳了再用真钱
- 💵 小资金试水，别一上来就 all in
- 🛑 一定要设止损
- 📊 定期检查策略参数

---

## 📜 免责声明

量化交易存在风险，过往收益不代表未来表现。请根据自身风险承受能力合理使用本系统。使用前请查阅 [服务条款](https://docs.itrade.icu/zh-CN/docs/terms-of-service) 与 [隐私政策](https://docs.itrade.icu/zh-CN/docs/privacy-policy)。

---

> 📝 **文档信息**
> 最后更新：2026-06-21 · 版本：v1.0.4
