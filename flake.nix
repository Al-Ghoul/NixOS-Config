{
  description = "Abdo's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
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
    sops-nix,
    ...
  }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.AlGhoul = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        sops-nix.nixosModules.sops

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.abdo = {
              imports = [
                ./home-manager.nix
                nixvim.homeManagerModules.nixvim
              ];
            };
          };
        }
      ];
    };
  };
}
