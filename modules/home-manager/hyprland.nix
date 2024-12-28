{ pkgs, ... }:
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
			"$mod, SPACE, exec, wofi"
			"$mod, E, exec, thunar"
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

		general = {
			gaps_in = 5;
			gaps_out= 5;
			border_size = 2;
			"col.active_border" = "rgba(13ACACee) rgba(16A0F3ee) 90deg";
			"col.inactive_border" = "rgba(595959aa)";
			layout = "dwindle";
		};
		misc = {
			disable_hyprland_logo= true;		
		};
		dwindle = {
			pseudotile = true;
			preserve_split = true;
		};
		decoration = {
			rounding = 5;
			blur = {
				enabled = true;
				size = 5;
				passes = 3;
				ignore_opacity = true;
				new_optimizations = true;
				popups = true;
			};
		};
		plugin = {
			hyprtrails.color = "rgba(ffaa00ff)";
		};
	};
	wayland.windowManager.hyprland.plugins = [
		pkgs.hyprlandPlugins.hyprtrails
	];
}
