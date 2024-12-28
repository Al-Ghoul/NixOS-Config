{
  description = "Abdo's NixOS configuration";


	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};


  outputs = all@{  nixpkgs,home-manager, ... }: {

    nixosConfigurations.AlGhoul = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	./configuration.nix
	home-manager.nixosModules.home-manager
	{
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.users.abdo = import ./home-manager.nix;
	}
      ] ;
    };


  };
}
