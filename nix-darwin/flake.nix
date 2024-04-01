{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
  }: let
    revision = self.rev or self.dirtyRev or null;
  in {
    darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
        ./overlays.nix
        ./system-packages.nix
      ];
      specialArgs = {inherit revision;};
    };
    darwinPackages = self.darwinConfigurations.mac.pkgs;
  };
}
