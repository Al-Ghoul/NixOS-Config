_: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "Lock";
      }

      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
      }

      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
      }

      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
      }

      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
      }

      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
      }
    ];
  };
}
