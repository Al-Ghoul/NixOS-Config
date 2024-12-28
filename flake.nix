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
	};


  outputs = {  nixpkgs,home-manager, nixvim, ... }: {

    nixosConfigurations.AlGhoul = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	      ./configuration.nix
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
      ] ;
    };


  };
}
