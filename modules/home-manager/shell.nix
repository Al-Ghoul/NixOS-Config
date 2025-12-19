{pkgs, ...}: {
  programs = {
    kitty = {
      enable = true;
      font = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "jetbrains mono nerd font";
      };
      settings = {
        foreground = "#dddddd";
        background = "#000000";
        cursor = "#dddddd";
        background_opacity = "0.9";
        dynamic_background_opacity = "1";
        cursor_trail = "1";
        linux_display_server = "auto";
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        selection_foreground = "none";
        selection_background = "none";

        active_tab_foreground = "#131114";
        active_tab_background = "#F9E4DF";
        inactive_tab_foreground = "#F9E4DF";
        inactive_tab_background = "#131114";

        active_border_color = "#F9E4DF";
        inactive_border_color = "#131114";
        bell_border_color = "#130A16";

        color0 = "#3B393C";
        color1 = "#5e2a24";
        color2 = "#912121";
        color3 = "#552C32";
        color4 = "#7a3232";
        color5 = "#9D4B6F";
        color6 = "#B3857A";
        color7 = "#EFD0C9";
        color8 = "#A7918C";
        color9 = "#553030";
        color10 = "#963535";
        color11 = "#723A43";
        color12 = "#a34343";
        color13 = "#D16494";
        color14 = "#EFB1A3";
        color15 = "#EFD0C9";

        enabled_layouts = "vertical,horizontal";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
      };
      keybindings = {
        "ctrl+right" = "resize_window narrower";
        "ctrl+left" = "resize_window wider";
        "ctrl+up" = "resize_window taller";
        "ctrl+down" = "resize_window shorter";
        "ctrl+home" = "resize_window reset";
        "ctrl+shift+t" = "new_tab_with_cwd";
        "ctrl+shift+n" = "no_op";
      };
      shellIntegration = {enableFishIntegration = true;};
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
      shellAbbrs = {
        lg = "lazygit";
        ld = "lazydocker";
      };
      plugins = [
        {
          inherit (pkgs.fishPlugins.grc) src;
          name = "grc";
        }
      ];
    };

    fzf = {enable = true;};
    zoxide = {enable = true;};

    tmux = {
      enable = true;
      keyMode = "vi";
      plugins = with pkgs.tmuxPlugins; [
        {
          plugin = rose-pine;
          extraConfig = ''
            set -g @rose_pine_variant 'main' # Options are 'main', 'moon' or 'dawn'
            set -g @rose_pine_bar_bg_disable 'on'
            set -g @rose_pine_bar_bg_disabled_color_option 'default'
          '';
        }

        {
          plugin = session-wizard;
          extraConfig = ''
            set -g @session-wizard 'T'
          '';
        }

        {
          plugin = mkTmuxPlugin {
            pluginName = "tmux-pomodoro-plus";
            version = "1.0.2";
            src = pkgs.fetchFromGitHub {
              owner = "olimorris";
              repo = "tmux-pomodoro-plus";
              rev = "0280f1409cd0232d6a84dff8ebad7feef3e1dddc";
              sha256 = "sha256-VmjqD4Ec0AiG6pylAxxxPO7+ghLSlHf098wwIUi/y+M=";
            };
            rtpFilePath = "pomodoro.tmux";
          };
          extraConfig = ''
            set -g status-right "#{pomodoro_status}"
            set -g @pomodoro_toggle 'p'                    # Start/pause a Pomodoro/break
            set -g @pomodoro_cancel 'P'                    # Cancel the current session
            set -g @pomodoro_skip '_'                      # Skip a Pomodoro/break

            set -g @pomodoro_mins 25                       # The duration of the Pomodoro
            set -g @pomodoro_break_mins 5                  # The duration of the break after the Pomodoro completes
            set -g @pomodoro_intervals 4                   # The number of intervals before a longer break is started
            set -g @pomodoro_long_break_mins 25            # The duration of the long break
            set -g @pomodoro_repeat 'off'                  # Automatically repeat the Pomodoros?
            set -g @pomodoro_disable_breaks 'off'          # Turn off breaks

            set -g @pomodoro_on " 🍅"                      # The formatted output when the Pomodoro is running
            set -g @pomodoro_complete " ✔︎"                 # The formatted output when the break is running
            set -g @pomodoro_pause " ⏸︎"                    # The formatted output when the Pomodoro/break is paused
            set -g @pomodoro_prompt_break " ⏲︎ break?"      # The formatted output when waiting to start a break
            set -g @pomodoro_prompt_pomodoro " ⏱︎ start?"   # The formatted output when waiting to start a Pomodoro

            set -g @pomodoro_menu_position "R"             # The location of the menu relative to the screen
            set -g @pomodoro_sound 'on'                   # Sound for desktop notifications (Run `ls /System/Library/Sounds` for a list of sounds to use on Mac)
            set -g @pomodoro_notifications 'on'           # Enable desktop notifications from your terminal
            set -g @pomodoro_granularity 'on'
            set -g status-interval 1                       # Refresh the status line every second
            set -g @pomodoro_interval_display "[%s/%s]"
          '';
        }
      ];

      extraConfig = ''
        # Splitting
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"

        # Smart pane switching with awareness of Neovim splits.
        bind-key -n C-h if -F "#{@pane-is-vim}" 'send-keys C-h'  'select-pane -L'
        bind-key -n C-j if -F "#{@pane-is-vim}" 'send-keys C-j'  'select-pane -D'
        bind-key -n C-k if -F "#{@pane-is-vim}" 'send-keys C-k'  'select-pane -U'
        bind-key -n C-l if -F "#{@pane-is-vim}" 'send-keys C-l'  'select-pane -R'

        bind-key -n M-h if -F "#{@pane-is-vim}" 'send-keys M-h' 'resize-pane -L 3'
        bind-key -n M-j if -F "#{@pane-is-vim}" 'send-keys M-j' 'resize-pane -D 3'
        bind-key -n M-k if -F "#{@pane-is-vim}" 'send-keys M-k' 'resize-pane -U 3'
        bind-key -n M-l if -F "#{@pane-is-vim}" 'send-keys M-l' 'resize-pane -R 3'

        tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
        if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
            "bind-key -n 'C-\\' if -F \"#{@pane-is-vim}\" 'send-keys C-\\'  'select-pane -l'"
        if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if -F \"#{@pane-is-vim}\" 'send-keys C-\\\\'  'select-pane -l'"

        bind-key -T copy-mode-vi 'C-h' select-pane -L
        bind-key -T copy-mode-vi 'C-j' select-pane -D
        bind-key -T copy-mode-vi 'C-k' select-pane -U
        bind-key -T copy-mode-vi 'C-l' select-pane -R
        bind-key -T copy-mode-vi 'C-\' select-pane -l
      '';
    };
  };
}
