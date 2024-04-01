{pkgs, ...}: {
  home.packages = with pkgs; [
    pyenv
    nodenv
  ];
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
