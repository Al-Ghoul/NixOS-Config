{pkgs, ...}: {
  imports = [
    ./modules/home-manager/hyprland.nix
    ./modules/home-manager/waybar.nix
    ./modules/home-manager/wofi.nix
    ./modules/home-manager/pkgs.nix
    ./modules/home-manager/shell.nix
    ./modules/home-manager/gtk.nix
    ./modules/home-manager/git.nix
    ./modules/home-manager/nixvim.nix
    ./modules/home-manager/direnv.nix
  ];

  home.username = "abdo";
  home.homeDirectory = "/home/abdo";
  home.stateVersion = "23.11";

  home.pointerCursor = {
    gtk.enable = true;
    name = "Vimix-cursors";
    package = pkgs.vimix-cursors;
    size = 16;
  };

  programs.home-manager.enable = true;
}
