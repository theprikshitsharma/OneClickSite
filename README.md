# 🚀 OneClickSite

> A simple Bash utility to deploy any static website (HTML, CSS, JS) from a GitHub repository to your local Apache server — all in one click.

---

## 🎯 What is OneClickSite?

**OneClickSite** is a beginner-friendly automation tool that:

- Installs **Apache** and **Git**
- Clones any public **GitHub** repo
- Deploys your site into Apache's root directory
- Starts the Apache server and shows your local hosting URL
- Outputs a clean terminal UI with headers and progress
- Logs all system errors and installation details into `install.log`

---

## 🧰 Requirements

- 🐧 Ubuntu/Debian-based Linux
- 🌐 Internet connection
- 🔐 sudo privileges
- 📦 `figlet` and `lolcat` (optional, for UI enhancement)

---

## 📦 Features

- 📥 One-click Apache + Git install
- 🌐 Deploys any static site (HTML/CSS/JS) instantly
- 📁 Cleans previous deployments
- 🖥️ Displays live local URL to view your site
- 📄 All logs/errors saved in `install.log`

---

## 🛠️ Installation & Usage

### 1️⃣ Clone the OneClickSite repo
git clone https://github.com/theprikshitsharma/OneClickSite.git

cd OneClickSite

### 2️⃣ Make the script executable
chmod +x start.sh

### 3️⃣ Run the script
./start.sh
