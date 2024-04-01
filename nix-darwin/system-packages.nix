{pkgs, ...}: let
  python = pkgs.python311.withPackages (ps: with ps; [powerline]);
  myVim = pkgs.vim-full.override {
    python3 = python;
    wrapPythonDrv = true;
  };
in {
  environment.systemPackages = [
    pkgs.alejandra
    pkgs.direnv
    pkgs.fzf
    pkgs.git
    pkgs.powerline
    pkgs.ranger
    pkgs.tmux
    myVim
  ];
}
