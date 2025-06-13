{ pkgs, ... }:
let theme = "circle_hud"; in
{
  boot = {
    plymouth = {
      enable = true;
      theme = "blahaj";
      themePackages = with pkgs; [
        plymouth-blahaj-theme
        # (adi1090x-plymouth-themes.override {
        #   selected_themes = [ theme ];
        # })
      ];
    };

    consoleLogLevel = 3;
    initrd.systemd.enable = true;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader.timeout = 0;
  };
}
