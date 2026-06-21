# iTrade ICU 量化交易系統

> 🌐 **語言切換**：[English](./README.md) · [简体中文](./README_zh-CN.md) · [繁體中文](./README_zh-TW.md) · [日本語](./README_ja.md) · [한국어](./README_ko.md) · [Français](./README_fr.md)

> 🔗 **快速連結**：[🌐 官網](https://itrade.icu) · [📖 文件](https://docs.itrade.icu) · [🐛 問題回饋](https://github.com/itradeicu/itrade.icu/issues)

---

## 📖 專案介紹

iTrade 是一個企業級量化交易系統用戶端，為專業交易者和量化團隊設計。系統整合了多種成熟的量化策略、安全加密機制和即時市場監控功能，支援主流 110+ 交易所的自動化交易。

- 🌐 官網：[https://itrade.icu](https://itrade.icu)
- 📖 文件：[https://docs.itrade.icu](https://docs.itrade.icu)

---

## 🚀 一鍵安裝

iTrade 提供跨平台的一鍵安裝腳本，支援 **Linux / macOS / Windows** 全平台，**自動偵測系統架構**（AMD/ARM），**自動從 GitHub 取得最新版本**。

<!-- TABS_START -->

### 🐧 Linux / 🍎 macOS

開啟終端機，執行以下指令即可一鍵下載、安裝並啟動：

```bash
curl -fsSL https://raw.githubusercontent.com/itradeicu/itrade/main/install.sh | sudo bash
```

> 💡 **提示**：
> - 需要 `sudo` 權限（首次執行 Docker 安裝）
> - 自動適配 `x86_64` (AMD) 和 `aarch64/arm64` (ARM) 架構
> - 自動從 [GitHub Releases](https://github.com/itradeicu/itrade/releases) 取得最新版本

### 🪟 Windows

**方式一：PowerShell 遠端執行（推薦）**

以系統管理員身分開啟 PowerShell，執行：

```powershell
irm https://raw.githubusercontent.com/itradeicu/itrade/main/install.bat | cmd
```

**方式二：手動下載**

1. 下載安裝腳本：[install.bat](https://github.com/itradeicu/itrade/releases/latest/download/install.bat)
2. 右鍵 → **以系統管理員身分執行**

> 💡 **提示**：
> - 需要先安裝 [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)
> - 自動適配 `AMD64` 和 `ARM64` 架構

<!-- TABS_END -->

### 📋 安裝流程說明

| 步驟 | 說明 |
|------|------|
| 1️⃣ 環境檢查 | 自動偵測 Docker / Docker Compose 是否就緒 |
| 2️⃣ 版本取得 | 從 GitHub Atom Feed 取得最新版本（無速率限制） |
| 3️⃣ 架構識別 | 自動判斷 AMD / ARM 架構 |
| 4️⃣ 舊版備份 | 備份舊版本到 `backup_YYYYMMDD_HHMMSS` 目錄 |
| 5️⃣ 下載解壓 | 下載對應架構的 Docker 映像檔 |
| 6️⃣ 啟動服務 | 自動啟動 Docker Compose 容器 |
| 7️⃣ 自動開啟 | 安裝完成後，瀏覽器存取 `https://127.0.0.1` |

---

## ⭐ 核心功能模組

### 📈 網格交易 - 震盪行情賺錢利器

價格來回波動的時候最賺錢。自動在區間內低買高賣，不用你管。

- ✅ 現貨和合約都支援
- ✅ 可以做多、做空、雙向同時掛單
- ✅ 馬丁格爾策略：越跌越買，拉低成本
- ✅ 四種風控模式：設停利停損價、按收益率自動停，隨你選

### 💰 資金費率套利 - 躺著賺費率

永續合約每 8 小時結算一次資金費率，這個功能就是專門賺這個錢的。

- ✅ 費率正就開空，費率負就開多，拿了費率就溜
- ✅ 時間卡得死死的，一秒都不會錯過
- ✅ 平倉時絕對不會反向開倉，安全感拉滿

### 📊 刷量 - 快速增加交易量

需要某個交易對看起來活躍？用它。

- ✅ 限價單、市價單都能刷
- ✅ 會模擬真人交易：下單金額隨機、持倉時間隨機、休息時間也隨機
- ✅ 設個目標成交量，刷夠了自動停，不浪費錢

### 🔄 定投 DCA - 分批買幣不虧錢

別一次性 all in，分批買更穩。

- ✅ CEX 和 DEX 都支援
- ✅ 按分鐘、小時、日、月定投，想怎麼定怎麼定
- ✅ 還能循環定投：隔幾秒買一次
- ✅ 可以設最大次數，買夠了自動停

### 👀 行情監控 - 24 小時盯盤助手

你睡覺，它幫你盯著。

- ✅ 多個交易所同時監控
- ✅ 鏈上地址變化也能監控
- ✅ 釘釘、Telegram、Discord、Webhook，哪裡都能通知你

### 🔔 TradingView Webhook - 訊號自動交易

TradingView 發訊號，系統自動買賣。

- ✅ 支援現貨和合約交易
- ✅ 安全碼驗證，防止偽造請求
- ✅ 支援 110+ 交易所 Webhook 接入
- ✅ 所有請求完整日誌追蹤

**使用方式**：
1. 在系統設定頁面建立 Webhook Token
2. 將 Token 加入 TradingView Alert 設定
3. TradingView 觸發訊號時，系統自動執行交易

### 🔍 幣種分析 - 智慧選幣助手

不知道選什麼幣？讓它幫你篩。

**CEX 幣種篩選**：
- ✅ 全市場 24h 資料掃描
- ✅ 按成交量、漲跌幅、市值篩選
- ✅ 支援多維度排序
- ✅ 即時更新，不錯過熱點

**DEX 熱門幣種**：
- ✅ 鏈上熱門幣種追蹤
- ✅ 支援多鏈篩選（ETH、BSC、SOL 等）
- ✅ 新幣發現，第一時間上車
- ✅ 市值、時間範圍自訂

### 📢 多管道推播 - 訊息觸達全覆蓋

重要事件發生，第一時間通知你。

- ✅ Telegram 推播
- ✅ Discord 推播
- ✅ 釘釘推播
- ✅ 飛書推播
- ✅ 微信推播
- ✅ 自訂 Webhook

---

## 💻 支援系統

| 系統 | 版本 | 架構 |
|------|------|------|
| 🐧 Linux | Ubuntu 20.04+ / Debian 11+ / CentOS 8+ | AMD64 / ARM64 |
| 🍎 macOS | macOS 11 (Big Sur) 及以上 | Intel / Apple Silicon |
| 🪟 Windows | Windows 10/11 (64-bit) | AMD64 / ARM64 |

---

## 🔐 安全這塊你放心

你的錢和密鑰，我比你自己還上心：

### 🛡️ 資料傳輸加密
ECDH 金鑰協商 + AES-256 加密，銀行級別的。定時自動無痛更換。

### 🔑 API 金鑰加密儲存
你的交易所金鑰絕不明文儲存，AES-256 加密後再存。

而且用了 HKDF 金鑰衍生技術，每個場景用不同的子金鑰。每個人的加密結果都不一樣，就算兩個人的資料一模一樣，加密後也完全不同。

> 💡 **資料庫外洩了？攻擊者也拿不到你的金鑰。**

### 🏠 資料安全
所有資料儲存在使用者側，承諾絕不上傳使用者私鑰/金鑰等敏感資訊。

---

## 🔧 常用維運指令

安裝完成後，可使用以下指令管理服務：

```bash
# 查看執行日誌
docker logs -f itrade-icu

# 啟動服務
docker compose up -d

# 停止服務
docker compose down

# 重啟服務
docker compose restart

# 解除安裝（刪除容器和檔案）
docker compose down && cd .. && rm -rf iTrade-Docker-ARM-v1.0.4
```

---

## 🔮 未來會有啥

- **鏈上自動交易**：智慧合約互動、MEV、跨鏈套利，區塊鏈上的全自動交易
- 更多交易所和策略
- 更多需求 [GitHub Issues](https://github.com/itradeicu/itrade.icu/issues)

---

## ⚠️ 說真的，有風險

量化交易不是穩賺的：

- 🧪 先用模擬盤測，穩了再用真錢
- 💵 小資金試水，別一上來就 all in
- 🛑 一定要設停損
- 📊 定期檢查策略參數

---

## 📜 免責聲明

量化交易存在風險，過往收益不代表未來表現。請根據自身風險承受能力合理使用本系統。使用前請查閱 [服務條款](https://docs.itrade.icu/zh-CN/docs/terms-of-service) 與 [隱私權政策](https://docs.itrade.icu/zh-CN/docs/privacy-policy)。

---

> 📝 **文件資訊**
> 最後更新：2026-06-21 · 版本：v1.0.4
