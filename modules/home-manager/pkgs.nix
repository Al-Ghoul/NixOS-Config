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
    lxappearance
  ];
}
