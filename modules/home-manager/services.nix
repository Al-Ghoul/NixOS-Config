_: {
  services = {
    easyeffects.enable = true;
    
    mako = {
      enable = true;
      font = "Fantasque Sans Mono 14";
      anchor = "top-right";
      defaultTimeout = 5000;
      sort = "-time";

      backgroundColor = "#1e1e2e";
      borderColor = "#313244";
      progressColor = "over #89b4fa";
      textColor = "#d9e0ee";
      padding = "15";
      borderSize = 2;
      borderRadius = 10;
      maxIconSize = 48;

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
