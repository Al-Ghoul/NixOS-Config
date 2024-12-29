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

    # Pulseaudio command line mixer
    pamixer
    pavucontrol

    # Screenshotting
    grim
    slurp # Area selection
    swappy # Annotations

    wl-clipboard # required by cliphist's service

    hyprpicker
  ];
}
