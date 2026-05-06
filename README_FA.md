# [MHR-CFW](https://github.com/denuitt1/mhr-cfw) Rewritten in Go with YouTube Support Fix and Speed Improvements

[![GitHub](https://img.shields.io/badge/GitHub-ThisIsDara-blue?logo=github)](https://github.com/ThisIsDara/mhr-cfw-go)

**[English](README.md)**

## 🚀 بهبودها نسبت به نسخه Python

## **✅ 1.  رفع مشکل پشتیبانی YouTube**

* مدیریت درست CORS — اضافه شدن هندل کردن preflight OPTIONS و تزریق هدرهای CORS برای درخواست‌های cross-origin
* رفع مشکل Content-Encoding — دیکود بهتر برای پاسخ‌های brotli/gzip
* پشتیبانی از Range request — استریم ویدیو نیاز به مدیریت درست هدر Range دارد

## **✅ 2. بهبود سرعت**

* استفاده از HTTP/2 به جای HTTP/1.1 (multiplexing سریع‌تر)
* Connection pooling — استفاده مجدد از اتصال‌های TLS به جای ساختن اتصال جدید
* Request coalescing — چند درخواست GET برای یک URL مشترک، یک تماس relay را به اشتراک می‌گذارند
* Response caching — کش LRU با TTL مناسب برای assetهای استاتیک

## **✅ 3. امنیت**

* ارتقا از 2048 بیت به کلید های RSA با طول 4096 بیت برای گواهی‌های MITM

## **✅ 4. کیفیت کد**

* بازنویسی با Go — تایپ استاتیک، مدیریت حافظه بهتر
* بدون وابستگی خارجی — استفاده از کتابخانه استاندارد در صورت امکان

---

## نحوه کار

این برنامه روی سیستم شما اجرا می‌شود و درخواست‌های شما را از طریق زیرساخت Google ارسال می‌کند. فیلترهای شبکه این ترافیک را به عنوان ترافیک عادی Google می‌بینند و اجازه عبور می‌دهند. در همین حین، Apps Script رایگان Google سایت واقعی مورد نظر شما را دریافت می‌کند.

---

## شروع سریع

### 1 - کلون و بیلد

```bash
git clone https://github.com/ThisIsDara/mhr-cfw-go.git
cd mhr-cfw-go
```

یا آخرین نسخه را از [GitHub Releases](https://github.com/ThisIsDara/mhr-cfw-go/releases) دانلود کنید

**💡 نکته:** اگر در نصب وابستگی‌های Go مشکل دارید، از میرور ایرانی رانفلر استفاده کنید:
```bash
GOPROXY=https://mirror-go.runflare.com go mod download
```

### 2 - اجرای build.bat

روی `build.bat` دوبار کلیک کنید یا اجرا کنید:

```powershell
.\build.bat
```

این کار فایل `mhr-cfw-go.exe` را می‌سازد

### 3 - تنظیمات

فایل `config.json` را با تنظیمات خود ویرایش کنید یا ترجیحاً Setup Wizard را در TUI اجرا کنید:

```json
{
  "auth_key": "your-secret-password-here",
  "script_id": "YOUR_DEPLOYMENT_ID"
}
```

### 4 - اجرا

روی `mhr-cfw-go.exe` دوبار کلیک کنید یا اجرا کنید:

```powershell
.\mhr-cfw-go.exe
```

برنامه یک منو باز می‌کند. گزینه `1) Start proxy` را انتخاب کنید تا پراکسی شروع شود.

---

### 5 - نصب CA Certificate (برای HTTPS)

برنامه را اجرا کنید، سپس از منو گزینه `3) Install CA certificate` را انتخاب کنید.

این کار Certificate Authority محلی را نصب می‌کند تا پراکسی بتواند ترافیک HTTPs را رهگیری کند.

---

# 🛠️ نحوه راه‌اندازی

1. فایل [mhr-cfw README](https://github.com/denuitt1/mhr-cfw/blob/main/README.md#how-to-use) را باز کنید و مراحل ارائه‌شده توسط [denuitt1](https://github.com/denuitt1) را دنبال کنید تا Deployment ID رو بگیرید.

---

## ساخت از سورس

پیش‌نیازها:

* [Go 1.22+](https://go.dev/dl/)

```bash
go build -ldflags "-s -w" -o mhr-cfw-go.exe ./cmd/mhr-cfw
```

---

## در حال توسعه...

### `📊 آمار`

* شمارنده درخواست — مجموع درخواست‌های پردازش‌شده
* میزان مصرف پهنای باند — بایت‌های ارسال/دریافت‌شده

### `🖥️ مانیتورینگ`

* وضعیت اتصال

### `✏️ تجربه کاربری`

* تعویض پروفایل — پروفایل‌های مختلف تنظیمات
* خروجی/ورودی گرفتن از config — بکاپ تنظیمات

---

## گزینه‌های خط فرمان

| Option             | Description                              |
| ------------------ | ---------------------------------------- |
| `--no-menu`        | اجرا بدون منوی TUI                       |
| `--port`           | تغییر پورت پراکسی                        |
| `--host`           | تغییر هاست listen                        |
| `--socks5-port`    | تغییر پورت SOCKS5                        |
| `--disable-socks5` | غیرفعال کردن پراکسی SOCKS5               |
| `--log-level`      | تنظیم سطح لاگ (DEBUG, INFO, WARN, ERROR) |
| `--install-cert`   | نصب CA certificate                       |
| `--uninstall-cert` | حذف CA certificate                       |
| `--scan`           | اسکن IPهای Google                        |
| `--setup`          | اجرای setup wizard                       |
| `--version`        | نمایش نسخه                               |

#### سلب مسئولیت

* **رعایت قوانین سرویس‌های Google:** اگر از Google Apps Script یا سایر سرویس‌های Google با این پروژه استفاده می‌کنید، مسئول رعایت Terms of Service، قوانین استفاده مجاز، quotaها و سیاست‌های پلتفرم هستید. استفاده نادرست ممکن است باعث تعلیق یا حذف اکانت Google یا deploymentهای شما شود.

---

## پروژه‌های اصلی

### بر پایه [mhr-cfw](https://github.com/denuitt1/mhr-cfw)، پیاده‌سازی Python که این پروژه از روی آن بازنویسی شده است.

## License

MIT
