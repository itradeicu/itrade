# iTrade ICU Système de Trading Quantitatif

> 🌐 **Langue**: [English](./README.md) · [简体中文](./README_zh-CN.md) · [繁體中文](./README_zh-TW.md) · [日本語](./README_ja.md) · [한국어](./README_ko.md) · [Français](./README_fr.md)

> 🔗 **Liens Rapides**: [🌐 Site Officiel](https://itrade.icu) · [📖 Documentation](https://docs.itrade.icu) · [🐛 Signaler un Problème](https://github.com/itradeicu/itrade.icu/issues)

---

## 🚀 Installation en Un Clic

iTrade fournit des scripts d'installation en un clic multiplateformes prenant en charge **Linux / macOS / Windows**. Il **détecte automatiquement l'architecture système** (AMD/ARM) et **récupère automatiquement la dernière version depuis GitHub**.

<!-- TABS_START -->

### 🐧 Linux / 🍎 macOS

Ouvrez votre terminal et exécutez la commande suivante pour télécharger, installer et lancer en un clic :

```bash
curl -fsSL https://raw.githubusercontent.com/itradeicu/itrade/main/install.sh | bash
```

> 💡 **Conseils** :
> - Nécessite les droits `sudo` (pour l'installation initiale de Docker)
> - S'adapte automatiquement aux architectures `x86_64` (AMD) et `aarch64/arm64` (ARM)
> - Récupère automatiquement la dernière version depuis [GitHub Releases](https://github.com/itradeicu/itrade/releases)

### 🪟 Windows

**Méthode 1 : Exécution à distance PowerShell (Recommandée)**

Ouvrez PowerShell en tant qu'administrateur et exécutez :

```powershell
irm https://raw.githubusercontent.com/itradeicu/itrade/main/install.bat | cmd
```

**Méthode 2 : Téléchargement Manuel**

1. Téléchargez le script d'installation : [install.bat](https://github.com/itradeicu/itrade/releases/latest/download/install.bat)
2. Clic droit → **Exécuter en tant qu'administrateur**

> 💡 **Conseils** :
> - Nécessite [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) installé au préalable
> - S'adapte automatiquement aux architectures `AMD64` et `ARM64`

<!-- TABS_END -->

### 📋 Processus d'Installation

| Étape | Description |
|------|------|
| 1️⃣ Vérification de l'environnement | Détection automatique de Docker / Docker Compose |
| 2️⃣ Récupération de version | Dernière version depuis GitHub Atom Feed (sans limite de débit) |
| 3️⃣ Détection d'architecture | Identification automatique AMD / ARM |
| 4️⃣ Sauvegarde de l'ancienne version | Sauvegarde dans le répertoire `backup_YYYYMMDD_HHMMSS` |
| 5️⃣ Téléchargement & Extraction | Téléchargement du package Docker correspondant |
| 6️⃣ Démarrage des services | Démarrage automatique des conteneurs Docker Compose |
| 7️⃣ Accès automatique | Visitez `https://127.0.0.1` après l'installation |

---

## 📖 Présentation du Projet

iTrade est un client de système de trading quantitatif de niveau entreprise conçu pour les traders professionnels et les équipes quantitatives. Le système intègre plusieurs stratégies quant éprouvées, des mécanismes de cryptage de sécurité et des fonctions de surveillance de marché en temps réel, prenant en charge le trading automatisé sur plus de 110 bourses principales.

- 🌐 Site Officiel : [https://itrade.icu](https://itrade.icu)
- 📖 Documentation : [https://docs.itrade.icu](https://docs.itrade.icu)

---

## ⭐ Modules Fonctionnels Principaux

### 📈 Trading en Grille - Gagner sur les Marchés en Range

Gagnez de l'argent quand les prix fluctuent. Achetez automatiquement au plus bas et vendez au plus haut dans une plage—aucune intervention manuelle nécessaire.

- ✅ Prend en charge les marchés au comptant et à terme
- ✅ Ordres de grille long, short et bidirectionnels
- ✅ Stratégie Martingale : acheter plus quand le prix baisse pour réduire le coût
- ✅ Quatre modes de contrôle des risques : stop profit/perte, arrêt auto par taux de rendement

### 💰 Arbitrage de Frais de Financement - Gagner des Frais Passivement

Les contrats à terme perpétuels règlent les frais de financement toutes les 8 heures. Cette fonction est conçue spécifiquement pour capturer ces frais.

- ✅ Quand le taux > 0, shorter ; quand le taux < 0, longer—prendre les frais et sortir
- ✅ Timing à la seconde près, ne manquez jamais une seconde
- ✅ N'ouvre jamais de position inverse lors de la fermeture, sécurité garantie

### 📊 Générateur de Volume - Augmenter le Volume de Trading

Besoin qu'une paire de trading paraisse active ? Utilisez ceci.

- ✅ Prend en charge les ordres limit et market
- ✅ Simule le comportement d'un vrai trader : taille d'ordre aléatoire, durée de détention aléatoire, temps de repos aléatoire
- ✅ Définissez un volume cible—arrêt automatique une fois atteint

### 🔄 DCA (Dollar Cost Average) - Éviter les Pertes d'All-In

Ne faites pas d'all-in d'un coup. Achetez par lots pour plus de stabilité.

- ✅ Prend en charge CEX et DEX
- ✅ Investissez par minute, heure, jour, mois—votre choix
- ✅ DCA en boucle : achat toutes les quelques secondes pour investissement haute fréquence
- ✅ Définissez le nombre max d'achats—arrêt automatique une fois atteint

### 👀 Surveillance de Marché - Gardien 24h/24

Vous dormez, il surveille pour vous.

- ✅ Surveillez plusieurs bourses simultanément
- ✅ Suivi des changements d'adresses on-chain
- ✅ Notifications via DingTalk, Telegram, Discord, Webhook

### 🔔 TradingView Webhook - Trading Automatisé par Signaux

TradingView envoie des signaux, le système trade automatiquement.

- ✅ Prend en charge le trading au comptant et à terme
- ✅ Vérification par code de sécurité contre les requêtes falsifiées
- ✅ Prend en charge l'intégration Webhook de plus de 110 bourses
- ✅ Suivi complet des logs de requêtes

**Comment l'utiliser** :
1. Créez un Token Webhook dans la page de configuration système
2. Ajoutez le Token aux paramètres d'Alerte TradingView
3. Quand TradingView déclenche un signal, le système exécute les trades automatiquement

### 🔍 Analyse de Jetons - Sélecteur Intelligent de Jetons

Vous ne savez pas quel jeton choisir ? Laissez-le filtrer pour vous.

**Screening CEX** :
- ✅ Scan complet des données 24h du marché
- ✅ Filtrage par volume, pourcentage de variation, capitalisation
- ✅ Tri multidimensionnel
- ✅ Mises à jour en temps réel, ne manquez jamais les jetons tendance

**Jetons Tendance DEX** :
- ✅ Suivi des jetons tendance on-chain
- ✅ Filtrage multi-chaînes (ETH, BSC, SOL, etc.)
- ✅ Découverte de nouveaux jetons, premier à surfer
- ✅ Capitalisation et plage de temps personnalisables

### 📢 Notifications Multi-Canaux - Couverture Complète

Quand des événements importants se produisent, vous êtes notifié en premier.

- ✅ Notifications Telegram
- ✅ Notifications Discord
- ✅ Notifications DingTalk
- ✅ Notifications Feishu
- ✅ Notifications WeChat
- ✅ Webhook personnalisé

---

## 💻 Systèmes Supportés

| OS | Version | Architecture |
|------|------|------|
| 🐧 Linux | Ubuntu 20.04+ / Debian 11+ / CentOS 8+ | AMD64 / ARM64 |
| 🍎 macOS | macOS 11 (Big Sur) et supérieur | Intel / Apple Silicon |
| 🪟 Windows | Windows 10/11 (64-bit) | AMD64 / ARM64 |

---

## 🔐 Sécurité : Vous Pouvez Faire Confiance

Nous prenons soin de votre argent et de vos clés mieux que vous :

### 🛡️ Cryptage de Transmission de Données
Échange de clés ECDH + cryptage AES-256, niveau bancaire. Rotation automatique des clés.

### 🔑 Stockage Crypté des Clés API
Vos clés d'échange ne sont jamais stockées en clair—elles sont cryptées avec AES-256 avant stockage.

Nous utilisons également la technologie de dérivation de clés HKDF, avec différentes sous-clés pour chaque scénario. Le résultat de cryptage de chaque utilisateur est unique—même si deux utilisateurs ont des données identiques, les résultats cryptés sont complètement différents.

> 💡 **Base de données compromise ? Les attaquants ne peuvent toujours pas obtenir vos clés.**

### 🏠 Sécurité des Données
Toutes les données sont stockées côté utilisateur. Nous promettons de ne jamais télécharger les clés privées, clés API ou autres informations sensibles des utilisateurs.

---

## 🔧 Commandes d'Opérations Courantes

Après l'installation, utilisez les commandes suivantes pour gérer les services :

```bash
# Voir les logs en cours
docker logs -f itrade-icu

# Démarrer les services
docker compose up -d

# Arrêter les services
docker compose down

# Redémarrer les services
docker compose restart

# Désinstaller (supprimer conteneurs et fichiers)
docker compose down && cd .. && rm -rf iTrade-Docker-ARM-v1.0.4
```

---

## 🔮 Feuille de Route

- **Trading Auto On-chain** : Interaction smart contracts, MEV, arbitrage cross-chain
- **Plus de Bourses** : Élargissement continu de la liste des bourses supportées
- **Plus de Stratégies** : Ajout de nouveaux types de stratégies selon les besoins des utilisateurs
- Soumettez vos besoins sur [GitHub Issues](https://github.com/itradeicu/itrade.icu/issues)

---

## ⚠️ Avertissement de Risque

Le trading quantitatif ne garantit pas les profits :

- 🧪 Testez d'abord en paper trading, puis utilisez l'argent réel après vérification
- 💵 Commencez avec un petit capital, ne faites pas d'all-in d'un coup
- 🛑 Définissez toujours un stop-loss pour éviter la liquidation sur marchés extrêmes
- 📊 Révisez régulièrement les paramètres de stratégie pour vous adapter aux changements du marché

---

## 📜 Avis de Non-Responsabilité

Le trading quantitatif comporte des risques. Les performances passées ne garantissent pas les résultats futurs. Veuillez utiliser ce système raisonnablement selon votre propre tolérance au risque. Avant utilisation, veuillez consulter nos [Conditions d'Utilisation](https://docs.itrade.icu/zh-CN/docs/terms-of-service) et [Politique de Confidentialité](https://docs.itrade.icu/zh-CN/docs/privacy-policy).

---

> 📝 **Informations du Document**
> Dernière Mise à Jour : 2026-06-21 · Version : v1.0.4
