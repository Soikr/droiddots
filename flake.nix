{
  description = "Basic example of Nix-on-Droid system config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    hm = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    meowvim = {
      url = "github:Soikr/meowvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nod = {
      url = "github:nix-community/nix-on-droid/testing";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "hm";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hm,
    nod,
    ...
  } @ inputs: let
    system = "aarch64-linux";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    nixOnDroidConfigurations.default = nod.lib.nixOnDroidConfiguration {
      modules = [
        ./droid
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "hm-bak";
            extraSpecialArgs = {inherit inputs;};
            config = ./hm;
          };
        }
      ];

      pkgs = import nixpkgs {
        inherit system;

        overlays = [
          nod.overlays.default
          inputs.meowvim.overlay
        ];
      };
    };
  };
}
