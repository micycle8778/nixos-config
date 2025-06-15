{ pkgs, ... }:
{
  imports = [
    ./rhythmbox.nix
  ];

  hardware.graphics = {
    enable = true;
    #driSupport = true;
    #driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers

    mangohud
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  #
  # # AMD firmware (required for GPU)
  # hardware.enableAllFirmware = true;
  #
  # # AMDGPU kernel module
  # boot.initrd.kernelModules = [ "amdgpu" ];
}
