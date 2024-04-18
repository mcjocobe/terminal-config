{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    home-manager,
    nix-darwin,
    nixpkgs,
  }: let
    revision = self.rev or self.dirtyRev or null;
    mkDarwinSystem = {
      extra-modules ? [],
      with-home-manager ? true,
      user ? "escodebar",
    }: let
      home-manager-modules =
        if with-home-manager
        then [
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import ./home-manager/${user}.nix;
          }
        ]
        else [];
    in
      nix-darwin.lib.darwinSystem {
        modules =
          [
            ./configuration.nix
            ./overlays.nix
            ./system-packages.nix
            ./user.nix
          ]
          ++ home-manager-modules
          ++ extra-modules;
        specialArgs = {inherit revision user;};
      };
  in {
    darwinConfigurations = {
      le-mini = mkDarwinSystem {
        user = "pablo.verges";
      };
      tiko-macbook = mkDarwinSystem {
        user = "escodebar";
        extra-modules = [
          ./tiko/builders.nix
        ];
      };
    };
    darwinPackages = self.darwinConfigurations.mac.pkgs;
  };
}
