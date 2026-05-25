
# Parabellum Linux Project (PLP-OS) 🌌
### Version: v1.0.0 "tyr" | Base: Devuan Stable (OpenRC)

> **"Si vis pacem, para bellum"** (If you want peace, prepare for war.)

PLP-OS is a **pure, minimalist, and independent** GNU/Linux distribution built from the ground up to fight against modern OS bloatware, invasive telemetry, and the forced dependency of `systemd`. It is designed for absolute user control, privacy, and peak performance.

---

## 🛠️ Core Philosophy & Features

* **Systemd-Free (Pure OpenRC):** Our system utilizes the lightweight, blazing-fast, and traditional UNIX-compliant OpenRC init system.
* **Zero Bloatware:** No unwanted media players, office suites, games, or hidden background services upon installation. RAM usage is kept at the absolute bare minimum.
* **Guided Minimalism:** Unlike Arch Linux, we don't abandon you in a naked $TTY$ screen. A **Pure Desktop Settings Manager** comes pre-installed so you can easily configure your screen resolution, Wi-Fi, and peripheral hardware.
* **Embedded Drivers (Non-Free Firmware Included):** The installation medium (`.iso`) includes non-free firmware for Broadcom, Intel, Realtek, etc. Your Wi-Fi, Bluetooth, and essential hardware will work out of the box during setup.
* **Failsafe Emergency Mode:** The installer creates a standard user for daily tasks, but a hidden root account with the default password `plp-root` remains active for emergency system interventions.

---

## 🖥️ User-Centric Post-Installation Menu

At the very end of the installation, the system prompts you with a clean menu to choose your preferred stack:
1. **Desktop Environments:** Choose between unmodified, pure **Vanilla Plasma**, **Minimal XFCE**, or **LXQt-Core**. *(GNOME will absolutely never be an option!)*
2. **Terminal Emulator:** The native terminal (`konsole` or `xfce4-terminal`) is injected as a **mandatory and default** component. It is the steering wheel of the OS and cannot be disabled.
3. **Curated Package Selection:** Optional, clean packages ready to be checked: `firefox-esr`, `ufw`, `vim`, and `git`.

---

## 🔒 Privacy & Our Honest Closing Message

When the installation is complete, right before the system reboots, the installer
