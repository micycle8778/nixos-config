{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rhythmbox
  ];
}
