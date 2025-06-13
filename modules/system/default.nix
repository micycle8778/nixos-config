# Default set of imports for my workstation and laptop

{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  boot.supportedFilesystems = [ "ntfs" ];

  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./cups.nix
    # ./distrobox.nix
    ./flatpak.nix
    ./fonts.nix
    ./docker.nix
    ./locale.nix
    ./micycle.nix
    ./nix-ld.nix
    ./nix.nix
    ./networkmanager.nix
    # ./onlykey.nix
    ./plymouth.nix
    ./sound.nix
    ./ssh.nix

    ./environments/gnome.nix
    ./environments/hyprland.nix

    ./programs/aseprite.nix
    ./programs/bat.nix
    ./programs/browser.nix
    ./programs/fortune.nix
    # ./programs/gnupg.nix
    ./programs/godot.nix
    ./programs/keepassxc.nix
    ./programs/kitty.nix
    ./programs/krita.nix
    ./programs/mpv.nix
    ./programs/nautilus.nix
    ./programs/neovim.nix
    # ./programs/steam.nix
    ./programs/thunderbird.nix
    ./programs/zathura.nix
  ];

  environment.systemPackages = [
    pkgs.vscode
  ];
}
