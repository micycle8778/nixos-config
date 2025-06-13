{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    fortune
    kittysay
    dotacat
  ];
}
