{pkgs, ...}: {
  # xdg-desktop-portal only exports interfaces that have a selected backend.
  #
  # Home Manager's hyprland module enables xdg.portal and points
  # NIX_XDG_DESKTOP_PORTAL_DIR at the user profile's
  # share/xdg-desktop-portal/portals. That directory only receives the portals
  # in extraPortals, so with just the Hyprland portal the frontend never sees
  # xdg-desktop-portal-gtk -- even though the system profile has it installed.
  # hyprland.portal implements Screenshot/ScreenCast/GlobalShortcuts but not
  # FileChooser, so without gtk here the frontend exports no FileChooser at all
  # and native file dialogs (SDL, GTK, ...) fail with "File dialog driver
  # unsupported".
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  xdg.portal.config.hyprland = {
    default = ["hyprland" "gtk"];
    "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
  };
}
