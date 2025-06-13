{pkgs, inputs, ...}:
{
  imports = [
  ];

  stylix.enable = true;

  # stylix.targets = {
  #   foot.enable = false;
  #   hyprland.enable = false;
  #   kitty.enable = false;
  #   mako.enable = false;
  #   rofi.enable = false;
  #   waybar.enable = false;
  #
  #   kde.enable = true;
  # };

  stylix.polarity = "dark";
  # stylix.image = ./../live/wallpapers/The_Verge_Hysteresis_Wallpaper_Landscape.0.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

  stylix.cursor = {
    package = pkgs.oreo-cursors-plus;
    name = "oreo_spark_white_bordered_cursors";
    size = 24;
  };

  stylix.fonts = {
    monospace = {
      package = pkgs.source-code-pro;
      name = "Source Code Pro";
    };
    sansSerif = {
      package = pkgs.ubuntu_font_family;
      name = "Ubuntu";
    };
    serif = {
      package = pkgs.source-serif;
      name = "Source Serif 4";
    };
    emoji = {
      package = pkgs.twemoji-color-font;
      name = "Twitter Color Emoji";
    };
  };

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 20;
    desktop = 10;
    popups = 10;
  };

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.8;
    desktop = 1.0;
    popups = 1.0;
  };

  stylix.iconTheme = {
    enable = true;
    package = pkgs.papirus-nord.override { accent = "polarnight1"; };
    # package = pkgs.papirus-icon-theme.override { color = "violet"; };
    dark = "Papirus-Dark";
  };

}
