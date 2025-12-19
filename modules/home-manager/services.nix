_: {
  services = {
    easyeffects.enable = true;

    mako = {
      enable = true;
      settings = {
        font = "Fantasque Sans Mono 14";
        anchor = "top-right";
        default-timeout = 5000;
        sort = "-time";
        background-color = "#1e1e2e";
        border-color = "#313244";
        progress-color = "over #89b4fa";
        text-color = "#d9e0ee";
        padding = "15";
        border-size = 2;
        border-radius = 10;
        max-icon-size = 48;
      };

      extraConfig = ''
        max-history=100
        # BINDING OPTIONS
        on-button-left=dismiss
        on-button-middle=none
        on-button-right=dismiss-all
        on-touch=dismiss

        [urgency=low]
        border-color=#313244
        default-timeout=2000

        [urgency=normal]
        border-color=#313244
        default-timeout=5000

        [urgency=high]
        border-color=#f38ba8
        text-color=#f38ba8
        default-timeout=0

        [category=mpd]
        border-color=#f9e2af
        default-timeout=2000
        group-by=category

        icon-location=left
        history=1
        text-alignment=center
        ignore-timeout=0
        layer=overlay
      '';
    };

    cliphist.enable = true;
  };
}
