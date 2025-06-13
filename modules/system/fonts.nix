{ lib, config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    # nerdfonts
    font-awesome

    corefonts
    dina-font
    fantasque-sans-mono
    fira-code
    fira-code-symbols
    noto-fonts
    liberation_ttf
    mplus-outline-fonts.githubRelease
    noto-fonts-cjk-sans
    noto-fonts-emoji
    proggyfonts
    roboto
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
