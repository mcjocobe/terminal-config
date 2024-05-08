{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    black
    direnv
    fasd
    fd
    fzf
    git
    neovim
    powerline
    pyenv
    ranger
    ripgrep
    sops
    tmux
    tree
    vault
    vim-configured
    vscode-configured
  ];
}
