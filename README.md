# [MHR-CFW](https://github.com/denuitt1/mhr-cfw) Rewritten in Go with YouTube Support Fix and Speed Improvements
[![GitHub](https://img.shields.io/badge/GitHub-ThisIsDara-blue?logo=github)](https://github.com/ThisIsDara/mhr-cfw-go)

**[فارسی](README_FA.md)**


<img width="654" height="362" alt="image" src="https://github.com/user-attachments/assets/bdf8ffd8-f1cd-47b4-87fd-5bc6e2ce1937" />


## 🚀 Improvements Over Python Version


 ## **✅ 1.  YouTube Support Fixed**
- Proper CORS handling — Added preflight OPTIONS handling and CORS header injection for cross-origin requests
- Content-Encoding fix — Better decoding for brotli/gzip responses
- Range request support — Video streaming needs proper Range header handling
## **✅ 2. Speed Improvements**
- HTTP/2 transport — Uses HTTP/2 instead of HTTP/1.1 (faster multiplexing)
- Connection pooling — Reuses TLS connections instead of creating new ones
- Request coalescing — Multiple GET requests for same URL share one relay call
- Response caching — LRU cache with proper TTL for static assets
## **✅ 3. Security**
- RSA 4096-bit keys — Upgraded from 2048-bit for MITM certificates
## **✅ 4. Reliability**
- Proper signal handling — Clean shutdown on Ctrl+C
- Graceful error handling — Better error responses
## **✅ 5. Code Quality**
- Go rewrite — Static typing, better memory management
- No external dependencies — Uses standard library where possible





---

## How It Works


The program runs on your PC and sends your requests through Google's infrastructure. Network filters see ordinary Google traffic and allow it through. Meanwhile, Google's free Apps Script fetches the actual website you wanted.

---

## Quick Start

 ## 📦 Requirements:
 - [Go 1.22+](https://go.dev/dl/)

 **💡 Tip:** If you have trouble downloading Go dependencies, use the Runflare Iranian mirror:
```bash
GOPROXY=https://mirror-go.runflare.com go mod download
```

### 1 - Clone and Build

```bash
git clone https://github.com/ThisIsDara/mhr-cfw-go.git
cd mhr-cfw-go
```

Or download the latest release from [ 📥 GitHub Releases](https://github.com/ThisIsDara/mhr-cfw-go/releases)

### 2 - Run build.bat

Double-click `build.bat` or run:

```powershell
.\build.bat
```

This will build the `mhr-cfw-go.exe` file.

### 3 - Configure

Edit `config.json` with your settings or ideally run `Setup Wizard` in the TUI:

```json
{
  "auth_key": "your-secret-password-here",
  "script_id": "YOUR_DEPLOYMENT_ID"
}
```

### 4 - Run

Double-click `mhr-cfw-go.exe` or run:

```powershell
.\mhr-cfw-go.exe
```

The app opens an interactive menu. Select ``1) Start proxy`` to begin.

---

### 5 - Install CA Certificate (for HTTPS interception)

Run the app, the select ``3) Install CA certificate`` from the menu.

This installs the local Certificate Authority so the proxy can intercept HTTPs traffic.

---

# 🛠️ How to Setup

1. Open [mhr-cfw README File](https://github.com/denuitt1/mhr-cfw/blob/main/README.md#how-to-use) provided by [denuitt1](https://github.com/denuitt1)
 and follow the steps 1 to 3 until you have the Deployment ID

---
## Building from Source

Requirements:
- [Go 1.22+](https://go.dev/dl/)

```bash
go build -ldflags "-s -w" -o mhr-cfw-go.exe ./cmd/mhr-cfw
```

---

## WIP...
### `` 📊 Statistics ``
- Request counter — Total requests served
- Bandwidth usage — Bytes sent/received
### `` 🖥️ Monitoring ``
- Connection status
### `` ✏️ UX ``
- Profile switching — Different config profiles
- Export/Import config — Backup settings
---

## Command Line Options

| Option | Description |
| --- | --- |
| `--no-menu` | Run without TUI menu |
| `--port` | Override proxy port |
| `--host` | Override listen host |
| `--socks5-port` | Override SOCKS5 port |
| `--disable-socks5` | Disable SOCKS5 proxy |
| `--log-level` | Set log level (DEBUG, INFO, WARN, ERROR) |
| `--install-cert` | Install CA certificate |
| `--uninstall-cert` | Remove CA certificate |
| `--scan` | Scan Google IPs |
| `--setup` | Run setup wizard |
| `--version` | Show version |

#### Disclaimer

- **Google services compliance:** If you use Google Apps Script or other Google services with this project, you are responsible for complying with Google's Terms of Service, acceptable use rules, quotas, and platform policies. Misuse may lead to suspension or termination of your Google account or deployments.
---

## Original Projects
### Based on [mhr-cfw](https://github.com/denuitt1/mhr-cfw), The Python implementation this project was rewritten from.



## License

MIT
