{
  pkgs,
  lib,
  ...
}: let
  vim-overlay = final: prev: let
    python = prev.pkgs.python311.withPackages (ps: with ps; [powerline]);
    vim-configured =
      (prev.pkgs.vim-full.override {
        python3 = python;
        wrapPythonDrv = true;
      })
      .customize {
        name = "vim";
        vimrcConfig = {
          customRC = lib.readFile ./configs/vimrc;
          packages = {
            vim-configured = with prev.pkgs;
            with vimPlugins; {
              start = [
                editorconfig-vim
                fzf-vim
                syntastic
                vim-colors-solarized
                vim-fugitive
                vim-sensible
              ];
            };
          };
        };
      };
  in {
    inherit vim-configured;
  };
in {
  nixpkgs.overlays = [
    vim-overlay
  ];
}
