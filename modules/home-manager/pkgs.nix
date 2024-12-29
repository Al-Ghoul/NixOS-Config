{pkgs, ...}: {
  home.packages = with pkgs; [
    # Browsers
    brave
    firefox-devedition

    # Text colorizes for fish
    grc

    mpvpaper
  ];
}
