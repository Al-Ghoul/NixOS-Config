{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Flat-Remix-GTK-Red-Darkest";
      package = pkgs.flat-remix-gtk;
    };
    iconTheme = {
      name = "Flat-Remix-Red-Dark";
      package = pkgs.flat-remix-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };
}
