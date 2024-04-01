{
  pkgs,
  revision,
  ...
}: let
in {
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  system.configurationRevision = revision;
  system.stateVersion = 4;
}
