# My NixOS Configuration

This repository contains my personal NixOS configuration, managed with Nix Flakes. It's tailored for a development and gaming setup.

## ✨ Key Features

-   **Desktop Environment**: [KDE Plasma 6](https://kde.org/plasma-desktop/)
-   **Key Applications**:
    -   **Browser**: [Vivaldi](https://vivaldi.com/)
    -   **Development**: [Visual Studio Code](https://code.visualstudio.com/), Qt Creator, GCC, CMake, Python, Android Tools
    -   **Communication**: [Telegram Desktop](https://desktop.telegram.org/), [Parsec](https://parsec.app/)
    -   **Gaming**: [Steam](https://store.steampowered.com/)
    -   **System**: [Tailscale](https://tailscale.com/), [Mihomo](https://github.com/MetaCubeX/mihomo) (Clash-meta core)
-   **Customizations**:
    -   **Input Method**: Rime with the [oh-my-rime](https://github.com/Mintimate/oh-my-rime) configuration for a rich CJK input experience.
    -   **Hardware**: [OpenRazer](https://openrazer.github.io/) & [Polychromatic](https://polychromatic.app/) for Razer device management.
    -   **Theming**: Catppuccin for KDE, Google Cursors.
-   **Hardware Support**:
    -   AMD GPU support with `amdvlk`.

## 📂 Structure

This configuration uses `nixos-unified` to simplify the structure of the flake.

-   `flake.nix`: The entry point for the Nix Flake. It defines the inputs and uses `nixos-unified` to wire everything together.
-   `configurations/`: This directory contains the main configurations for my systems.
    -   `nixos/`: NixOS configurations.
    -   `home/`: Home Manager configurations.
-   `modules/`: This directory contains modularized parts of the configuration, which are then imported into the main configurations.
    -   `nixos/`: NixOS modules, such as for packages and hardware.
    -   `home/`: Home Manager modules.

## 🚀 Usage

To build a specific NixOS configuration from this flake on an existing NixOS installation, you can use the following command:

```bash
nixos-rebuild switch --flake .#nixos
