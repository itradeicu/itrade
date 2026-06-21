# iTrade ICU 퀀트 트레이딩 시스템

> 🌐 **언어**: [English](./README.md) · [简体中文](./README_zh-CN.md) · [繁體中文](./README_zh-TW.md) · [日本語](./README_ja.md) · [한국어](./README_ko.md) · [Français](./README_fr.md)

> 🔗 **빠른 링크**: [🌐 공식 웹사이트](https://itrade.icu) · [📖 문서 센터](https://docs.itrade.icu) · [🐛 이슈](https://github.com/itradeicu/itrade.icu/issues)

---

## 🚀 원클릭 설치

iTrade는 **Linux / macOS / Windows** 플랫폼을 지원하는 원클릭 설치 스크립트를 제공합니다. **시스템 아키텍처 자동 감지**(AMD/ARM), **GitHub에서 최신 버전 자동 다운로드**.

<!-- TABS_START -->

### 🐧 Linux / 🍎 macOS

터미널을 열고 다음 명령을 실행하면 다운로드, 설치, 시작이 한 번에 완료됩니다:

```bash
curl -fsSL https://raw.githubusercontent.com/itradeicu/itrade/main/install.sh | sudo bash
```

> 💡 **팁**:
> - `sudo` 권한 필요 (최초 Docker 설치 시)
> - `x86_64` (AMD) 및 `aarch64/arm64` (ARM) 아키텍처 자동 지원
> - [GitHub Releases](https://github.com/itradeicu/itrade/releases)에서 최신 버전 자동 가져오기

### 🪟 Windows

**방법 1: PowerShell 원격 실행 (권장)**

관리자 권한으로 PowerShell을 열고 다음을 실행:

```powershell
irm https://raw.githubusercontent.com/itradeicu/itrade/main/install.bat | cmd
```

**방법 2: 수동 다운로드**

1. 설치 스크립트 다운로드: [install.bat](https://github.com/itradeicu/itrade/releases/latest/download/install.bat)
2. 마우스 우클릭 → **관리자 권한으로 실행**

> 💡 **팁**:
> - 사전에 [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) 설치 필요
> - `AMD64` 및 `ARM64` 아키텍처 자동 지원

<!-- TABS_END -->

### 📋 설치 과정

| 단계 | 설명 |
|------|------|
| 1️⃣ 환경 확인 | Docker / Docker Compose 가용성 자동 감지 |
| 2️⃣ 버전 가져오기 | GitHub Atom Feed에서 최신 버전 가져오기 (속도 제한 없음) |
| 3️⃣ 아키텍처 감지 | AMD / ARM 아키텍처 자동 식별 |
| 4️⃣ 이전 버전 백업 | 이전 버전을 `backup_YYYYMMDD_HHMMSS` 디렉토리로 백업 |
| 5️⃣ 다운로드 및 압축 해제 | 해당 아키텍처 Docker 패키지 다운로드 |
| 6️⃣ 서비스 시작 | Docker Compose 컨테이너 자동 시작 |
| 7️⃣ 자동 접근 | 설치 완료 후 브라우저에서 `https://127.0.0.1` 방문 |

---

## 📖 프로젝트 소개

iTrade는 전문 트레이더와 퀀트 팀을 위한 엔터프라이즈급 퀀트 트레이딩 시스템 클라이언트입니다. 여러 검증된 퀀트 전략, 보안 암호화 메커니즘, 실시간 시장 모니터링 기능을 통합하여 110개 이상의 주요 거래소의 자동 트레이딩을 지원합니다.

- 🌐 공식 웹사이트: [https://itrade.icu](https://itrade.icu)
- 📖 문서 센터: [https://docs.itrade.icu](https://docs.itrade.icu)

---

## ⭐ 핵심 기능 모듈

### 📈 그리드 트레이딩 - 횡보장에서 돈 벌기

가격이 오갈 때 가장 많은 수익을 올립니다. 범위 내에서 자동으로 저가 매수, 고가 매도, 수동 조작 불필요.

- ✅ 현물 및 선물 모두 지원
- ✅ 롱, 숏, 양방향 그리드 주문 가능
- ✅ 마틴게일 전략: 가격 하락 시 더 매수하여 비용 낮추기
- ✅ 4가지 리스크 관리 모드: 익절/손절 가격 설정, 수익률 기반 자동 정지

### 💰 펀딩 수수료 차익 거래 - 수수료로 돈 벌기

무기한 선물은 8시간마다 펀딩 수수료를 정산합니다. 이 기능은 바로 그 수수료를 벌기 위한 것입니다.

- ✅ 수수료 > 0이면 숏, < 0이면 롱, 수수료 받고 즉시 청산
- ✅ 초 단위로 정확한 타이밍, 1초도 놓치지 않음
- ✅ 청산 시 절대 역방향 포지션 열지 않음, 안전성 보장

### 📊 볼륨 메이커 - 거래량 빠르게 증가

특정 거래쌍이 활발해 보이도록 만들고 싶으신가요? 이것을 사용하세요.

- ✅ 지정가 및 시장가 주문 모두 지원
- ✅ 실제 트레이더 행동 시뮬레이션: 주문 금액 랜덤, 보유 시간 랜덤, 휴식 시간 랜덤
- ✅ 목표 거래량 설정, 달성 시 자동 정지, 낭비 없음

### 🔄 DCA (정액 분할 매수) - 올인하지 않기

한 번에 올인하지 마세요. 분할 매수가 더 안정적입니다.

- ✅ CEX 및 DEX 모두 지원
- ✅ 분, 시간, 일, 월 단위로 투자, 자유롭게 설정
- ✅ 루프 DCA: 몇 초마다 매수, 고빈도 투자
- ✅ 최대 횟수 설정, 달성 시 자동 정지

### 👀 시황 모니터링 - 24시간 감시 도우미

당신이 자는 동안 모니터링이 지켜봅니다.

- ✅ 여러 거래소 동시 모니터링
- ✅ 온체인 주소 변동 모니터링
- ✅ DingTalk, Telegram, Discord, Webhook으로 알림

### 🔔 TradingView Webhook - 시그널 자동 거래

TradingView가 시그널을 보내면 시스템이 자동으로 매매합니다.

- ✅ 현물 및 선물 거래 지원
- ✅ 보안 코드 검증으로 위조 요청 방지
- ✅ 110개 이상의 거래소 Webhook 통합 지원
- ✅ 모든 요청의 완전한 로그 추적

**사용 방법**:
1. 시스템 설정 페이지에서 Webhook 토큰 생성
2. TradingView Alert 설정에 토큰 추가
3. TradingView가 시그널을 트리거하면 시스템이 자동으로 거래 실행

### 🔍 코인 분석 - 스마트 코인 선택기

어떤 코인을 선택해야 할지 모르겠나요? 필터링을 맡기세요.

**CEX 코인 스크리닝**:
- ✅ 전체 시장 24시간 데이터 스캔
- ✅ 거래량, 변동률, 시가총액별 필터링
- ✅ 다차원 정렬 지원
- ✅ 실시간 업데이트, 핫코인 놓치지 않음

**DEX 인기 코인**:
- ✅ 온체인 인기 코인 추적
- ✅ 멀티체인 필터링 (ETH, BSC, SOL 등)
- ✅ 신규 코인 발견, 가장 먼저 탑승
- ✅ 시가총액 및 시간 범위 사용자 정의

### 📢 다중 채널 알림 - 메시지 전달全覆盖

중요한 이벤트가 발생하면 가장 먼저 알려드립니다.

- ✅ Telegram 알림
- ✅ Discord 알림
- ✅ DingTalk 알림
- ✅ Feishu 알림
- ✅ WeChat 알림
- ✅ 사용자 정의 Webhook

---

## 💻 지원 시스템

| OS | 버전 | 아키텍처 |
|------|------|------|
| 🐧 Linux | Ubuntu 20.04+ / Debian 11+ / CentOS 8+ | AMD64 / ARM64 |
| 🍎 macOS | macOS 11 (Big Sur) 이상 | Intel / Apple Silicon |
| 🪟 Windows | Windows 10/11 (64-bit) | AMD64 / ARM64 |

---

## 🔐 보안은 안심하셔도 됩니다

당신의 돈과 키를 당신보다 더 신경 써서 관리합니다:

### 🛡️ 데이터 전송 암호화
ECDH 키 교환 + AES-256 암호화, 은행급. 정기적 자동 키 교체.

### 🔑 API 키 암호화 저장
거래소 키는 절대 평문으로 저장하지 않으며, AES-256으로 암호화한 후 저장합니다.

또한 HKDF 키 파생 기술을 사용하여 각 시나리오에 대해 다른 서브 키를 사용합니다. 사용자마다 암호화 결과가 다르며, 두 사용자의 데이터가 동일하더라도 암호화 결과는 완전히 다릅니다.

> 💡 **데이터베이스가 유출되어도 공격자는 당신의 키를 얻을 수 없습니다.**

### 🏠 데이터 보안
모든 데이터는 사용자 측에 저장되며, 사용자의 개인 키, API 키 등 민감한 정보를 절대 업로드하지 않습니다.

---

## 🔧 일반 운영 명령

설치 후 다음 명령으로 서비스를 관리할 수 있습니다:

```bash
# 실행 로그 확인
docker logs -f itrade-icu

# 서비스 시작
docker compose up -d

# 서비스 중지
docker compose down

# 서비스 재시작
docker compose restart

# 제거 (컨테이너 및 파일 삭제)
docker compose down && cd .. && rm -rf iTrade-Docker-ARM-v1.0.4
```

---

## 🔮 향후 계획

- **온체인 자동 거래**: 스마트 컨트랙트 상호작용, MEV, 크로스체인 차익거래
- **더 많은 거래소**: 지원 거래소 목록 지속 확대
- **더 많은 전략**: 사용자 요구에 따라 새 전략 유형 추가
- 자세한 내용은 [GitHub Issues](https://github.com/itradeicu/itrade.icu/issues)에 제출하세요

---

## ⚠️ 리스크 경고

퀀트 트레이딩은 보장된 수익이 아닙니다:

- 🧪 먼저 모의 투자로 테스트, 검증 후 실제 자금 사용
- 💵 소액으로 시작, 한 번에 올인하지 않기
- 🛑 반드시 손절 설정, 극단적 시장의 청산 방지
- 📊 전략 파라미터 정기 검토, 시장 변화에 적응

---

## 📜 면책 조항

퀀트 트레이딩에는 리스크가 따릅니다. 과거 수익률이 미래 수익을 보장하지 않습니다. 본인의 리스크 허용도에 따라 합리적으로 본 시스템을 사용해 주세요. 사용 전 [이용 약관](https://docs.itrade.icu/zh-CN/docs/terms-of-service) 및 [개인정보 처리방침](https://docs.itrade.icu/zh-CN/docs/privacy-policy)을 확인하세요.

---

> 📝 **문서 정보**
> 최종 업데이트: 2026-06-21 · 버전: v1.0.4
