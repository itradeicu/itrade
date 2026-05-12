# iTrade ICU Quantitative Trading System

[中文版](./README_zh-CN.md)

## Project Overview

iTrade is an enterprise-grade quantitative trading system client, designed for professional traders and quantitative teams. The system integrates multiple mature quantitative strategies, security encryption mechanisms, and real-time market monitoring, supporting automated trading across 110+ mainstream exchanges.

+ Website: [https://itrade.icu](https://itrade.icu)
+ Documentation: [https://docs.itrade.icu](https://docs.itrade.icu)

---

## Five Core Features

### 📈 Grid Trading - Profit from Volatility

The best tool for sideways markets. Automatically buys low and sells high within your price range.

- Supports both spot and futures trading
- Go long, short, or neutral with simultaneous orders on both sides
- Martingale strategy: buy more as price drops, lowering your average cost
- Four risk control modes: set stop-loss/take-profit prices, or auto-stop based on ROI

### 💰 Funding Fee Arbitrage - Earn Fees While You Sleep

Perpetual contracts settle funding fees every 8 hours. This feature is designed to capture those fees.

- Short when the rate is positive, long when negative, and walk away with the fee
- Precision timing - never miss a settlement moment
- Reduce-only protection - never accidentally open a reverse position

### 📊 Volume Boost - Rapid Trading Volume Generation

Need your trading pair to look more active? Use this.

- Supports limit orders and market orders
- Mimics real human behavior: random order amounts, random holding times, random rest intervals
- Set a target volume and it stops automatically when reached - no wasted fees

### 🔄 DCA - Dollar Cost Averaging

Don't go all-in at once. Spread your buys to lower risk.

- Supports both CEX and DEX
- Invest by minute, hour, day, or month - your schedule, your rules
- Loop mode available: buy every X seconds
- Set a maximum count - stops automatically when reached

### 👀 Market Monitor - 24/7 Surveillance

Sleep while it watches the market for you.

- Monitor multiple exchanges simultaneously
- Track on-chain address changes
- Notifications via DingTalk, Telegram, Discord, or Webhook - wherever you want

---

## 🔐 Security You Can Trust

Your money and keys - we guard them more carefully than you do:

### Data Transmission Encryption
ECDH key exchange + AES-256 encryption, bank-grade security. Keys rotate automatically and seamlessly.

### API Key Encrypted Storage
Your exchange keys are never stored in plaintext - AES-256 encrypted before saving.

Using HKDF key derivation technology, each scenario gets a unique sub-key. Everyone's encryption result is different - even if two people store identical data, the encrypted results are completely different.

Database compromised? Attackers still can't get your keys.

### Data Privacy
All data is stored on the user side. We never upload sensitive information like private keys or API keys.

---

## 🔮 What's Coming Next

- **TradingView Webhook**: TradingView sends signals, the system trades automatically
- **On-Chain Auto Trading**: Smart contract interaction, MEV, cross-chain arbitrage - full automation on the blockchain
- More exchanges and strategies
- More features requested on [GitHub Issues](https://github.com/itradeicu/itrade.icu/issues)

---

## ⚠️ Real Talk - There Are Risks

Quantitative trading isn't a guaranteed money machine:

- Test on paper trading first, only go live when stable
- Start small - don't all-in from day one
- Always set stop-loss
- Review your strategy parameters regularly

---

## Disclaimer

Quantitative trading involves risk. Past performance does not indicate future results. Please use this system responsibly based on your risk tolerance. Read our [Terms of Service](https://docs.itrade.icu/en-US/docs/terms-of-service) and [Privacy Policy](https://docs.itrade.icu/en-US/docs/privacy-policy) before use.
