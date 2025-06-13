{pkgs, ...}:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-shell
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-console
    epiphany
  ];


}
