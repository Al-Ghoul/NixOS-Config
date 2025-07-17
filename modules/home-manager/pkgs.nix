{pkgs, ...}: {
  home.packages = with pkgs; [
    # Browsers
    brave
    firefox-devedition

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

    telegram-desktop

    gromit-mpx

    # davinci-resolve-studio

    audacity
    virt-manager

    gitflow

    spotify
    whatsapp-for-linux
    inkscape # SVG editor

    scrcpy # Android screen mirroring
  ];
}
