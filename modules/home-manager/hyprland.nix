{ ... }:
{
	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.settings = {
		"$mod" = "SUPER";
		bind = [
			"$mod, Q, exec, kitty"	
			"$mod, B, exec, brave"	
			"$mod, S, togglespecialworkspace, magic"	
			"$mod SHIFT, S, movetoworkspace, special:magic"
			"$mod, F4, killactive"
			"$mod, [, exit"
			"$mod, V, togglefloating"
			"$mod, P, pseudo"
			"$mod, J, togglesplit"
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
		bindm = [
			"$mod, mouse:272, movewindow"
			"$mod, mouse:273, resizewindow"
		];

	};
}
