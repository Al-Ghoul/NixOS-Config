{pkgs, ...}:
{
	home.packages = with pkgs; [
		brave		
		lazygit

		# Text colorizes for fish
		grc

		mpvpaper
	];
}
