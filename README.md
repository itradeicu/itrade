# iTrade ICU Quantitative Trading System

[中文版](./README_zh-CN.md)

## Project Overview

iTrade is an enterprise-grade quantitative trading system client, designed for professional traders and quantitative teams. The system integrates multiple mature quantitative strategies, security encryption mechanisms, and real-time market monitoring, supporting automated trading across 110+ mainstream exchanges.

+ Website: [https://itrade.icu](https://itrade.icu)
+ Documentation: [https://docs.itrade.icu](https://docs.itrade.icu)

---

## Five Core Features

### 📈 Grid Trading - Profit from Volatility

This feature is most profitable when prices are fluctuating. Automatically buy low and sell high within the price range, no need for manual intervention.

- Supports both spot and futures trading
- Go long, short, or neutral with simultaneous orders on both sides
- Martingale strategy: buy more as price drops, lowering average cost
- Four risk control modes: set stop-loss/take-profit prices, or auto-stop based on ROI

### 💰 Funding Fee Arbitrage - Earn Fees While You Sleep

Perpetual contracts settle funding fees every 8 hours. This feature is specifically designed to capture those fees.

- Short when rate is positive, long when negative, take the fee and leave
- Precision timing - never miss a single second of settlement
- Reduce-only protection - absolutely no accidental reverse positions

### 📊 Volume Boost - Rapid Trading Volume Generation

Need a trading pair to look more active? Use this.

- Both limit orders and market orders supported
- Mimics real human trading: random order amounts, random holding times, random rest intervals
- Set a target volume, automatically stops when reached - no wasted fees

### 🔄 DCA - Dollar Cost Averaging

Don't go all-in at once. Spread your buys for lower risk.

- Supports both CEX and DEX
- DCA by minute, hour, day, or month - your schedule, your rules
- Loop mode available: buy every X seconds
- Set maximum count - auto-stops when reached

### 👀 Market Monitor - 24/7 Trading Assistant

You sleep, it watches the market for you.

- Multiple exchanges monitored simultaneously
- On-chain address changes also monitored
- Notifications via DingTalk, Telegram, Discord, Webhook - wherever you want

---

## Supported Systems
+ Linux
+ macOS
+ Windows

---

## 🔐 Security You Can Trust

Your money and keys - I care more about them than you do:

### Data Transmission Encryption
ECDH key exchange + AES-256 encryption, bank-grade. Automatic painless rotation on schedule.

### API Key Encrypted Storage
Your exchange keys are never stored in plaintext - AES-256 encrypted before saving.

Using HKDF key derivation technology, each scenario gets a unique sub-key. Everyone's encryption result is different - even if two people store identical data, the encrypted results are completely different.

Database compromised? Attackers still can't get your keys.

### Data Privacy
All data is stored on the user side. We promise never to upload sensitive information like private keys or API keys.

---

## 🔮 What's Coming Next

- **TradingView Webhook**: TradingView sends signals, system trades automatically
- **On-Chain Auto Trading**: Smart contract interaction, MEV, cross-chain arbitrage - full automation on the blockchain
- More exchanges and strategies
- More requests [GitHub Issues](https://github.com/itradeicu/itrade.icu/issues)

---

## ⚠️ Real Talk - There Are Risks

Quantitative trading isn't guaranteed profit:

- Test on paper trading first, only go live when stable
- Start small - don't all-in from day one
- Always set stop-loss
- Review strategy parameters regularly

---

## Disclaimer

Quantitative trading involves risk. Past performance does not indicate future results. Please use this system responsibly based on your risk tolerance. Read our [Terms of Service](https://docs.itrade.icu/en-US/docs/terms-of-service) and [Privacy Policy](https://docs.itrade.icu/en-US/docs/privacy-policy) before use.
