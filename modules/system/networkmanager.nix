{ pkgs, ...}:
{
  # Enable networking
  networking.networkmanager.enable = true;
  
  environment.systemPackages = with pkgs; [
    openconnect
    networkmanager-openconnect
  ];
}
