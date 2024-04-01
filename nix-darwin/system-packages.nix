{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    direnv
    fasd
    fd
    fzf
    git
    powerline
    ranger
    ripgrep
    tmux
    vim-configured
  ];
}
