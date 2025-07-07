# My NixOS Configuration

This repository contains my personal NixOS configuration, managed with Nix Flakes.

## Structure

This configuration uses [`nixos-unified`](https://github.com/srid/nixos-unified) to simplify the structure of the flake.

- `flake.nix`: The entry point for the Nix Flake. It defines the inputs and uses `nixos-unified` to wire everything together.
- `configurations/`: This directory contains the main configurations for my systems.
  - `nixos/`: NixOS configurations.
  - `home/`: Home Manager configurations.
- `modules/`: This directory contains modularized parts of the configuration, which are then imported into the main configurations.
  - `nixos/`: NixOS modules.
  - `home/`: Home Manager modules.

## Usage

To build a specific NixOS configuration from this flake, you can use the following command:

```bash
nixos-rebuild switch --flake .#nixos
```

Replace `nixos` with the name of the host you want to build.
