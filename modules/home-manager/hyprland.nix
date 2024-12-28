{ ... }:
{
	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.settings = {
		"$mod" = "SUPER";
		bind = [
			"$mod, Q, exec, kitty"	
		]
		++ (
				builtins.concatLists (builtins.genList (i:
						let ws = i + 1;
						in [
						"$mod, code:1${toString i}, workspace, ${toString ws}"
						"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"	
						]
						)
					10)
		   );
	};
}
