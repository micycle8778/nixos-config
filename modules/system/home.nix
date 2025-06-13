{inputs, config, lib, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  
  config = {
    home-manager.users.micycle = { pkgs, ... }: {
      imports = [
        inputs.stylix.homeManagerModules.stylix
        ./../stylix.nix
      ];

      home.stateVersion = "24.11";

      # home.file.".icons/default".source = "${pkgs.oreo-cursors-plus}/share/icons/oreo_spark_white_bordered_cursors";

      dconf.settings = {
        "org/gnome/shell" = {
          favorite-apps = [ 
            "firefox.desktop" 
            "org.gnome.Nautilus.desktop" 
            "org.codeberg.dnkl.foot.desktop"
            "org.keepassxc.KeePassXC.desktop"
            "obsidian.desktop"
          ];
        };

        "org/gnome/desktop/interface" = {
          clock-show-seconds = true;
          clock-show-weekday = true;
          color-scheme = "prefer-dark";
          enable-hot-corners = false;
          font-antialiasing = "grayscale";
        };

        "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
      };
    };
  };
}
