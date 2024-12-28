{ ... }:
{
	imports = [
		./modules/home-manager/hyprland.nix	
		./modules/home-manager/wofi.nix	
		./modules/home-manager/pkgs.nix	
		./modules/home-manager/shell.nix	
	];

	home.username = "abdo";
	home.homeDirectory = "/home/abdo";
	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
