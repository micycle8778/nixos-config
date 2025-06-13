{inputs, pkgs, ...}:
{
  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    hypridle # idle detect
    hyprlock # lockscreen

    grim # screenshotter
    slurp # region select
    swappy # screenshot editor
    wl-clipboard # clipboard management

    playerctl # control music

    swayosd # volume hud

    mako # notifications

    sway # for swaynag

    rofi-wayland # application launcher

    waybar # status
    pavucontrol # volume
    blueberry # bluetooth
    inputs.waybar-multi-battery.packages."x86_64-linux".default # battery

    wpaperd # wallpaper

    mate.mate-polkit
  ];
}
