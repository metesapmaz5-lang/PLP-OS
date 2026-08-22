# PLP OS 2.0 "Ellie"

> **A minimalist Debian experience where your data is not the product — control belongs to you.**

PLP OS is an independent Linux distribution built on **Debian 12 Bookworm** with a focus on simplicity, privacy, performance and user control.

Version **2.0 "Ellie"** is a complete refresh of the project, bringing a cleaner installer, lighter default software selection and new branding.

---

## ✨ What's New in PLP OS 2.0 "Ellie"

* Debian 12 **Bookworm** base.
* Minimal Debian installation with **KDE Plasma** selected by default.
* **Falkon** replaces Firefox as the default web browser.
* New **PLP OS Ellie** wallpaper collection.
* Updated installer branding and ISO metadata.
* Cleaner package selection with less pre-installed software.
* Improved project structure for future releases.

---

## 🎯 Project Goals

PLP OS is designed around a few simple principles:

* **Privacy first** — your data belongs to you.
* **Minimal by default** — install only what you need.
* **Open source** — built entirely on free software.
* **Fast and lightweight** — less background software, more resources for the user.

---

## 📦 Default Software

| Package                 | Purpose                     |
| ----------------------- | --------------------------- |
| KDE Plasma              | Default desktop environment |
| Falkon                  | Lightweight web browser     |
| NetworkManager          | Network management          |
| Git                     | Version control             |
| Curl / Wget             | Network utilities           |
| Nano                    | Terminal text editor        |
| Live Boot / Live Config | Debian live environment     |

---

## 🖼️ Ellie Wallpapers

PLP OS 2.0 includes a custom wallpaper collection inspired by the **Ellie** release theme.

* `plp-wallpaper-ellie-default.png`
* `plp-wallpaper-ellie-geometric.png`
* `plp-wallpaper-ellie-sketch.png`

These wallpapers are included directly inside the ISO.

---

## 💻 Installation

PLP OS uses the **Debian Installer (Netinstall)**.

During installation:

* KDE Plasma is selected by default.
* Users can customize packages through the Debian installer.
* Firmware support is enabled for compatible hardware.

---

## 🚀 Building the ISO

PLP OS is built using **Debian live-build**.

```bash
sudo lb clean
sudo lb build
```

The build process generates a hybrid ISO ready for virtual machines or USB installation.

---

## 📜 License

PLP OS is released under the **GNU General Public License v3.0 (GPL-3.0)**.

Copyright © 2026 Mete Sapmaz.

---

## ❤️ About PLP OS

> **Welcome to a world where your data is not a product, and control belongs to you.**

Thank you for supporting the **Parabellum Linux Project (PLP OS)**.
