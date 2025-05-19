# NixOS Configuration with Home Manager for Multi-User and Multi-Device Setups

A modular and reproducible NixOS setup with Hyprland, a customized Waybar, a styled Hyprlock GUI, and a curated selection of everyday applications. GNOME is also available as an alternative desktop environment.

---

**⚠️ Disclaimer:**  
This repository is a **work in progress** and reflects my personal setup and experimentation with NixOS. There are more polished and production-ready NixOS configurations available online. If you're looking for clean, beginner-friendly examples, I recommend exploring other community-maintained configs. That said, feel free to explore and borrow ideas!

---

## What is this?

This is a comprehensive configuration for the NixOS Linux distribution. It uses the Nix package manager and Nix flakes to declaratively define the entire operating system environment — including system settings, desktop environments, and user applications — in a version-controlled and reproducible way.

This setup is designed to support **multiple devices and users**. It allows you to share common configurations across machines while also customizing per-device and per-user preferences. Every package and setting is declarative, repeatable, and fully rollback-capable.

---

## Why?

When setting up a new Linux PC, I wanted a system that was reproducible, declarative, and easy to manage across multiple machines. NixOS stood out due to its configuration-as-code approach — define everything in a single file or repository, track it with Git, and replicate your setup anywhere by simply cloning the repo. 

It also encourages experimentation — if you break something while tweaking your configuration, you can simply roll back to the previous working version and try again. This makes it much safer and more fun to customize your setup without fear of permanent breakage.

After experimenting with NixOS in a virtual machine, I committed to building a personal configuration that includes:
- A custom lock screen
- A consistent color scheme across all applications
- All my preferred tools and settings preinstalled

While my daily driver is a MacBook (and NixOS isn’t an option there), I’m considering replacing Homebrew with the Nix package manager and Home Manager to unify and version my dotfiles and development environment.

---

## How to Use This Configuration

1. Clone this repository on a machine with NixOS already installed.
2. Copy your machine’s `hardware-configuration.nix` to `repo/hosts/nixos/`.
3. Make sure flakes are enabled in your Nix configuration.
4. Apply the configuration using:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

