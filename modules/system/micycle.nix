{inputs, config, lib, ...}:
{
  imports = [
      ./home.nix
      # inputs.home-manager.nixosModules.default

      # ./../stylix.nix
  ];

  options.extraHyprlandSettings = lib.mkOption {
    default = {};
    description = "Extra settings for hyprland.";
  };

  config = {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.micycle = {
      isNormalUser = true;
      description = "Michael Campbell";
      extraGroups = [ "networkmanager" "wheel" "docker" "storage" "dialout" "gamemode" ];
    };

    # Enable automatic login for the user.
    services.displayManager.autoLogin = {
      enable = true;
      user = "micycle";
    };

    services.displayManager.defaultSession = "hyprland";
    # services.displayManager.sddm.enable = true;
    # services.displayManager.sddm.wayland.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;

    # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;

    # Enable UPower for hyprland
    services.upower.enable = true;
  };
}
