{pkgs, ...}: {
  home.packages = with pkgs; [];
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
