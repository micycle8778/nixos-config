{pkgs, inputs, ...}:
{
  environment.systemPackages = with pkgs; [
    neovim
    git
    gcc
    inputs.rustaceanvim.packages."x86_64-linux".codelldb
    clang-tools
    ripgrep
  ];
}
