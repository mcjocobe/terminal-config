{
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
    mkDarwinSystem = {extra-modules ? []}:
      nix-darwin.lib.darwinSystem {
        modules =
          [
            ./configuration.nix
            ./overlays.nix
            ./system-packages.nix
          ]
          ++ extra-modules;
        specialArgs = {inherit revision;};
      };
  in {
    darwinConfigurations = {
      le-mini = mkDarwinSystem {};
      tiko-macbook = mkDarwinSystem {};
    };
    darwinPackages = self.darwinConfigurations.mac.pkgs;
  };
}
