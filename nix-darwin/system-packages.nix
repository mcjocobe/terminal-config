{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    direnv
    fzf
    git
    powerline
    ranger
    tmux
    vim-configured
  ];
}
