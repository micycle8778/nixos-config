{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    mpv
    yt-dlp
  ];
}
