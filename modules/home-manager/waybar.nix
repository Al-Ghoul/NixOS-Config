{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        spacing = 10;
        margin-left = 5;
        margin-right = 5;
        output = ["eDP-1" "HDMI-A-1"];
        modules-center = ["hyprland/window"];
        modules-left = ["hyprland/workspaces"];
        "modules-right" = [
          "tray"
          "idle_inhibitor"

          "network"
          "disk"
          "memory"
          "cpu"
          "temperature"

          "pulseaudio"
          "pulseaudio#microphone"

          "hyprland/language"
          "clock"
        ];

        tray = {
          icon-size = 16;
          spacing = 10;
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "󰛊 ";
            "deactivated" = "󰾫 ";
          };
        };

        "hyprland/workspaces" = {
          "show-special" = true;
          "persistent-workspaces" = {"*" = [1 2 3 4 5 6 7];};
          "format" = "{icon}";
          "format-icons" = {
            "active" = "";
            "empty" = "";
            "default" = "";
            "urgent" = "";
            "special" = "";
          };
        };

        "hyprland/window" = {"rewrite" = {"" = "❄️ NixOS ❄️";};};

        network = {
          interface = "enp8s0";
          interval = 2;
          "format-icons" = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
          format = "Error";
          "tooltip-format" = "Error";
          "format-wifi" = "{icon}";
          "tooltip-format-wifi" = ''
            {ipaddr}/{cidr}
            {essid} ({signalStrength}%) {icon}

            {ifname}
            {frequency}GHz {signaldBm}dBm  

             {bandwidthUpBits} |  {bandwidthDownBits} |  {bandwidthTotalBits}'';
          "format-ethernet" = " ";
          "tooltip-format-ethernet" = ''
            {ipaddr}/{cidr}
            {essid}

            {ifname}

            {bandwidthUpBits} {bandwidthDownBits} {bandwidthTotalBits}'';
          "format-disconnected" = " ";
          "tooltip-format-disconnected" = "  Disconnected";
        };

        disk = {
          interval = 15;
          format = "󰋊 {percentage_used}%";
          "tooltip-format" = ''
            Used  : {used}
            Total : {total} ({percentage_used}%)
            Disk  : {path}'';
        };

        memory = {
          interval = 10;
          format = " {used}";
          "tooltip-format" = ''
            Used  : {used}GiB
            Total : {total}GiB ({percentage}%)'';
        };

        cpu = {
          interval = 10;
          format = " {usage}%";
        };

        temperature = {interval = 10;};

        clock = {
          interval = 1;
          format = "{:%H:%M:%S}";
          "tooltip-format" = "<small>{calendar}</small>";
          calendar = {
            mode = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>w{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-click-middle" = "shift_reset";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "";
          on-click = pkgs.writeShellScript "toggle-sound" ''
            if [ "$(pamixer --get-mute)" == "false" ]; then
              pamixer -m
            elif [ "$(pamixer --get-mute)" == "true" ]; then
              pamixer -u
            fi
          '';
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          tooltip = true;
          tooltip-format = "{icon} at {volume}%";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "";
          format-source-muted = "";
          on-click = pkgs.writeShellScript "toggle-mic" ''
            if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
              pamixer --default-source -m
            elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
                pamixer -u --default-source u
            fi
          '';
          on-scroll-down = pkgs.writeShellScript "dec-mic-vol" ''
            pamixer --default-source -d 5 && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "" "Mic-Level : $(pamixer --default-source --get-volume) %"
          '';
          on-scroll-up = pkgs.writeShellScript "inc-mic-vol" ''
            pamixer --default-source -i 5 && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "" "Mic-Level : $(pamixer --default-source --get-volume) %"
          '';
          tooltip = true;
          tooltip-format = " at {volume}%";
        };
      };
    };
    style = ''
           * {
             font-family: "JetBrainsMono Nerd Font";
           }

           window#waybar {
             background: rgba(0, 0, 0, 0);
             font-size: 0.8rem;
             border-radius: 0.5rem;
           }

           tooltip {
             font-size: 0.8rem;
           }

           .modules-left,
           .modules-center {
             background: radial-gradient(circle, rgba(180,9,9,1) 0%, rgba(19,25,32,1) 100%);
             border-radius: 0.5rem;
             padding: 2px;
           }

           .modules-center {
      color: white;
           }

           .modules-right {
             background: radial-gradient(circle, rgba(180,9,9,1) 0%, rgba(19,25,32,1) 90%);
             border-radius: 0.5rem;
             padding: 2px 2px 2px 10px;
      color: white;
           }

           #pulseaudio {
             padding-right: 5px;
           }

           #workspaces {
             background-color: rgba(0,0,0,0.7);
             border-radius: 0.5rem;
             padding: 4px;
           }

            #workspaces button {
              font-size: 0.7rem;
              padding: 0 0.3rem 0 0;
            }

            #workspaces button.special {
              font-size: 0.7rem;
              padding: 0 0.3rem 0 0;
            }

            #workspaces button.active {
              color: #CA1A1A;
            }

            #workspaces button.urgent {
              color: red;
            }

            #window {
              background-color: rgba(0,0,0,0.7);
              border-radius: 0.5rem;
              padding: 2px 5px;
            }

            #clock {
              font-weight: bolder;
              border-radius: 0.5rem;
              padding: 0 3px 0 0;
            }

            #memory {
              color: lightpink;
            }

            #disk {
              color: lightskyblue;
            }

            #cpu {
              color: lightgoldenrodyellow;
            }

            #temperature {
              color: lightslategray;
            }
    '';
  };
}
