{pkgs, ...}:
{
	home.packages = with pkgs; [
		brave		

		# Text colorizes for fish
		grc
	];
}
