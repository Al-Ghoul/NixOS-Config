{pkgs, ...}: {
  wayland.windowManager.hyprland.package = pkgs.hyprland.overrideAttrs (_oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Al-Ghoul";
      repo = "hyprland";
      fetchSubmodules = true;
      hash = "sha256-nUVwD+trJj7n2+QNZaMsj9ZAg1dfD8L2+J9IF0D4xh0=";
      rev = "9af01aa238ef6a2b8dcbdefc82495c8330bfaa18";
    };
  });
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, Q, exec, kitty"
        "$mod, B, exec, brave"
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
        "$mod, F4, killactive"
        "$mod, V, togglefloating"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "$mod, SPACE, exec, wofi"
        "$mod, E, exec, thunar"
        "$mod, D, exec, vesktop"
        "$mod, X, exec, grim -g \"$(slurp)\" - | swappy -f - "

        "ALT, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, L, exec, swaylock"
        "$mod,  M, exec, wlogout --protocol layer-shell"
      ]
      ++ (
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
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
    exec-once = [
      "mpvpaper --auto-stop --mpv-options 'loop-file=inf no-config hwdec=auto' '*' '/mnt/HardDriveOne/Wallpapers/Video/mylivewallpapers-com-Omen-4K.mp4'"
      "waybar"
      "mako"
      "wl-paste --watch cliphist store"
    ];
    input = {
      kb_layout = "us,ara";
      kb_options = "grp:alt_shift_toggle, compose:ralt";
    };
    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 2;
      "col.active_border" = "rgba(A03D2Cee) rgba(000000ee) 90deg";
      "col.inactive_border" = "rgba(595959aa)";
      layout = "dwindle";
    };
    misc = {
      disable_hyprland_logo = true;
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
    windowrulev2 = [
      "opacity 0.8 0.5,class:^(vesktop)$"
      "animation popin,class:^(vesktop)$"

      "animation popin,class:^(thunar)$"
      "opacity 0.8 0.8,class:^(thunar)$"

      "move cursor -3% -105%,class:^(wofi)$"
      "noanim,class:^(wofi)$"
      "opacity 0.8 0.6,class:^(wofi)$"

      "opacity 0.7 0.7,class:^(obsidian)$"
      "animation popin,class:^(obsidian)$"

      "animation popin,class:^(brave)$"

      "tag +terminal, class:^(kitty|kitty-dropterm|com.mitchellh.ghostty)$"

      "opacity 0.8 0.7, tag:terminal*"

      "float, class:^(mpv)$"

      "noblur, class:^(Gromit-mpx)$"
    ];
    plugin = {
      hyprtrails.color = "rgba(A03D2CEE)";
    };
  };
  wayland.windowManager.hyprland.plugins = [
    pkgs.hyprlandPlugins.hyprtrails
  ];
}
