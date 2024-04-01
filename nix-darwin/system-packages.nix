{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    direnv
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
