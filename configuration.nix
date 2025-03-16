{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "AlGhoul"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  environment.variables = {
    EDITOR = "nvim";
  };

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        vhostUserPackages = [pkgs.virtiofsd];
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            })
            .fd
          ];
        };
      };
    };
  };

  hardware.graphics.enable = true;
  programs = {
    hyprland.enable = true;
    thunar.enable = true;
    fish.enable = true;
  };
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "AlGhoul-SDDM-Theme";
        autoNumlock = true;
        settings = {
          Autologin = {
            Session = "hyprland";
            User = "alghoul";
          };
        };
      };
      defaultSession = "hyprland";
    };
    # Screen sharing
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      audio.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  users.users.abdo = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "libvirtd"];
    shell = pkgs.fish;
  };

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    extraOptions = ''
      !include ${config.sops.templates."nix-extra-config".path}
    '';
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    libsForQt5.qt5.qtgraphicaleffects
    (callPackage ./modules/nix-os/alghoul-sddm-theme.nix {})
  ];

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/abdo/.config/sops/age/keys.txt";
      generateKey = true;
    };
    secrets.github-token = {};
    templates = {
      "nix-extra-config" = {
        group = "users";
        mode = "440";
        content = "access-tokens = github.com=${config.sops.placeholder.github-token}";
      };
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
