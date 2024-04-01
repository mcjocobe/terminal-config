{pkgs, ...}: let
  vim-overlay = final: prev: let
    python = prev.pkgs.python311.withPackages (ps: with ps; [powerline]);
    vim-configured = prev.pkgs.vim-full.override {
      python3 = python;
      wrapPythonDrv = true;
    };
  in {
    inherit vim-configured;
  };
in {
  nixpkgs.overlays = [
    vim-overlay
  ];
}
