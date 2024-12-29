{pkgs, ...}: {
  home.packages = with pkgs; [
    # Browsers
    brave
    firefox-devedition

    # Text colorizes for fish
    grc

    mpvpaper

    # Dev related
    tmux-sessionizer
    tree
    lazydocker

    # Misc
    pomodoro-gtk
    obsidian

    # Media recording
    obs-studio

    # Social
    vesktop

    # Audio/Video player
    mpv

    # sends desktop notifications to a notification daemon
    libnotify

    wl-clipboard # required by cliphist's service
  ];
}
