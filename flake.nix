{
  description = "Abdo's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    devshell,
    sops-nix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [devshell.overlays.default];
    };
  in {
    devShells."${system}".default = pkgs.devshell.mkShell {imports = [(pkgs.devshell.importTOML ./devshell.toml)];};

    nixosConfigurations.AlGhoul = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        sops-nix.nixosModules.sops

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.abdo = {
            imports = [
              ./home-manager.nix
              nixvim.homeManagerModules.nixvim
            ];
          };
        }
      ];
    };
  };
}
