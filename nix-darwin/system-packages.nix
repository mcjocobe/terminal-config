{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    direnv
    fasd
    fd
    fzf
    git
    powerline
    pyenv
    ranger
    ripgrep
    tmux
    tree
    vim-configured
    neovim
    vscode-configured
  ];
}
