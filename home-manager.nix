{ ... }:
{
	imports = [
		./modules/home-manager/hyprland.nix	
	];

	home.username = "abdo";
	home.homeDirectory = "/home/abdo";
	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}
