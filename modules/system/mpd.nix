{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mpd
    mpc
    mpd-mpris
  ];
}
