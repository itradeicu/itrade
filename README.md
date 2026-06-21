# iTrade ICU Quantitative Trading System

> 🌐 **Language**: [English](./README.md) · [简体中文](./README_zh-CN.md) · [繁體中文](./README_zh-TW.md) · [日本語](./README_ja.md) · [한국어](./README_ko.md) · [Français](./README_fr.md)

> 🔗 **Quick Links**: [🌐 Website](https://itrade.icu) · [📖 Documentation](https://docs.itrade.icu) · [🐛 Issues](https://github.com/itradeicu/itrade.icu/issues)

---

## 🚀 One-Click Installation

iTrade provides cross-platform one-click installation scripts supporting **Linux / macOS / Windows**. It **auto-detects system architecture** (AMD/ARM) and **auto-fetches the latest version from GitHub**.

<!-- TABS_START -->

### 🐧 Linux / 🍎 macOS

Open your terminal and run the following command for one-click download, installation, and launch:

```bash
curl -fsSL https://raw.githubusercontent.com/itradeicu/itrade/main/install.sh | sudo bash
```

> 💡 **Tips**:
> - Requires `sudo` permission (for initial Docker installation)
> - Auto-adapts to `x86_64` (AMD) and `aarch64/arm64` (ARM) architectures
> - Auto-fetches the latest version from [GitHub Releases](https://github.com/itradeicu/itrade/releases)

### 🪟 Windows

**Method 1: PowerShell Remote Execution (Recommended)**

Open PowerShell as Administrator and run:

```powershell
irm https://raw.githubusercontent.com/itradeicu/itrade/main/install.bat | cmd
```

**Method 2: Manual Download**

1. Download the installer: [install.bat](https://github.com/itradeicu/itrade/releases/latest/download/install.bat)
2. Right-click → **Run as Administrator**

> 💡 **Tips**:
> - Requires [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) installed first
> - Auto-adapts to `AMD64` and `ARM64` architectures

<!-- TABS_END -->

### 📋 Installation Process

| Step | Description |
|------|------|
| 1️⃣ Environment Check | Auto-detect Docker / Docker Compose availability |
| 2️⃣ Version Fetch | Get latest version from GitHub Atom Feed (no rate limit) |
| 3️⃣ Architecture Detection | Auto-identify AMD / ARM architecture |
| 4️⃣ Backup Old Version | Backup old version to `backup_YYYYMMDD_HHMMSS` directory |
| 5️⃣ Download & Extract | Download the matching architecture Docker package |
| 6️⃣ Start Services | Auto-start Docker Compose containers |
| 7️⃣ Auto Access | Visit `https://127.0.0.1` after installation |

---

## 📖 Introduction

iTrade is an enterprise-grade quantitative trading system client designed for professional traders and quant teams. The system integrates multiple proven quant strategies, security encryption mechanisms, and real-time market monitoring functions, supporting automated trading on 110+ mainstream exchanges.

- 🌐 Website: [https://itrade.icu](https://itrade.icu)
- 📖 Documentation: [https://docs.itrade.icu](https://docs.itrade.icu)

---

## ⭐ Core Features

### 📈 Grid Trading - Profit from Range-Bound Markets

Make money when prices fluctuate. Automatically buy low and sell high within a range—no manual intervention needed.

- ✅ Supports both spot and futures markets
- ✅ Long, short, and bidirectional grid orders
- ✅ Martingale strategy: buy more as price drops to lower cost basis
- ✅ Four risk control modes: stop profit/loss, auto-stop by return rate, your choice

### 💰 Funding Fee Arbitrage - Earn Fees Passively

Perpetual futures settle funding fees every 8 hours. This feature is designed specifically to capture those fees.

- ✅ When rate > 0, go short; when rate < 0, go long—take the fee and exit
- ✅ Pinpoint timing, never miss a second
- ✅ Never opens reverse position when closing, ensuring safety

### 📊 Volume Maker - Boost Trading Volume

Need a trading pair to look active? Use this.

- ✅ Supports both limit and market order volume generation
- ✅ Simulates real trader behavior: random order size, random holding time, random rest periods
- ✅ Set target volume—auto-stops when target is reached, no wasted money

### 🔄 DCA (Dollar Cost Average) - Avoid All-In Losses

Don't all-in at once. Buy in batches for stability.

- ✅ Supports both CEX and DEX
- ✅ Invest by minute, hour, day, month—your choice
- ✅ Loop DCA: buy every few seconds for high-frequency investing
- ✅ Set max purchase count—auto-stops when target is reached

### 👀 Market Monitor - 24/7 Watchdog

You sleep, it watches for you.

- ✅ Monitor multiple exchanges simultaneously
- ✅ Track on-chain address changes
- ✅ Notifications via DingTalk, Telegram, Discord, Webhook

### 🔔 TradingView Webhook - Automated Signal Trading

TradingView sends signals, the system trades automatically.

- ✅ Supports spot and futures trading
- ✅ Security code verification prevents forged requests
- ✅ Supports 110+ exchange Webhook integration
- ✅ Complete request log tracking

**How to use**:
1. Create a Webhook Token in the system configuration page
2. Add the Token to your TradingView Alert settings
3. When TradingView triggers a signal, the system executes trades automatically

### 🔍 Coin Analysis - Smart Coin Selector

Don't know which coin to pick? Let it help you filter.

**CEX Coin Screener**:
- ✅ Full market 24h data scanning
- ✅ Filter by volume, change percentage, market cap
- ✅ Multi-dimensional sorting
- ✅ Real-time updates, never miss hot coins

**DEX Hot Coins**:
- ✅ On-chain hot coin tracking
- ✅ Multi-chain filtering (ETH, BSC, SOL, etc.)
- ✅ New coin discovery, first to ride the wave
- ✅ Customizable market cap and time range

### 📢 Multi-Channel Notifications - Full Coverage Messaging

When important events happen, you're notified first.

- ✅ Telegram notifications
- ✅ Discord notifications
- ✅ DingTalk notifications
- ✅ Feishu notifications
- ✅ WeChat notifications
- ✅ Custom Webhook

---

## 💻 Supported Systems

| OS | Version | Architecture |
|------|------|------|
| 🐧 Linux | Ubuntu 20.04+ / Debian 11+ / CentOS 8+ | AMD64 / ARM64 |
| 🍎 macOS | macOS 11 (Big Sur) and above | Intel / Apple Silicon |
| 🪟 Windows | Windows 10/11 (64-bit) | AMD64 / ARM64 |

---

## 🔐 Security You Can Trust

We take care of your money and keys better than you do:

### 🛡️ Data Transmission Encryption
ECDH key agreement + AES-256 encryption, bank-level. Automatic seamless key rotation.

### 🔑 API Key Encrypted Storage
Your exchange keys are never stored in plaintext—they're encrypted with AES-256 before storage.

We also use HKDF key derivation technology, using different sub-keys for each scenario. Each user's encryption result is unique—even if two users have identical data, the encrypted results are completely different.

> 💡 **Database leaked? Attackers still can't get your keys.**

### 🏠 Data Security
All data is stored on the user side. We promise never to upload user private keys, API keys, or other sensitive information.

---

## 🔧 Common Operations Commands

After installation, use the following commands to manage services:

```bash
# View running logs
docker logs -f itrade-icu

# Start services
docker compose up -d

# Stop services
docker compose down

# Restart services
docker compose restart

# Uninstall (remove containers and files)
docker compose down && cd .. && rm -rf iTrade-Docker-ARM-v1.0.4
```

---

## 🔮 Roadmap

- **On-chain Auto Trading**: Smart contract interaction, MEV, cross-chain arbitrage
- **More Exchanges**: Continuously expanding supported exchange list
- **More Strategies**: Adding new strategy types based on user needs
- Submit your needs at [GitHub Issues](https://github.com/itradeicu/itrade.icu/issues)

---

## ⚠️ Risk Warning

Quantitative trading is not guaranteed profit:

- 🧪 Test with paper trading first, then use real money after verification
- 💵 Start with small capital, don't all-in at once
- 🛑 Always set stop-loss to prevent liquidation in extreme markets
- 📊 Regularly review strategy parameters to adapt to market changes

---

## 📜 Disclaimer

Quantitative trading involves risk. Past performance does not guarantee future results. Please use this system reasonably according to your own risk tolerance. Before use, please review our [Terms of Service](https://docs.itrade.icu/zh-CN/docs/terms-of-service) and [Privacy Policy](https://docs.itrade.icu/zh-CN/docs/privacy-policy).

---

> 📝 **Document Info**
> Last Updated: 2026-06-21 · Version: v1.0.4
