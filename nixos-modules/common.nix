{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./bluetooth.nix
    ./creative.nix
    ./android.nix
  ];

  options = {
    common.i3Enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    common.hyprlandEnable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Pacific/Auckland";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_NZ.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_NZ.UTF-8";
      LC_IDENTIFICATION = "en_NZ.UTF-8";
      LC_MEASUREMENT = "en_NZ.UTF-8";
      LC_MONETARY = "en_NZ.UTF-8";
      LC_NAME = "en_NZ.UTF-8";
      LC_NUMERIC = "en_NZ.UTF-8";
      LC_PAPER = "en_NZ.UTF-8";
      LC_TELEPHONE = "en_NZ.UTF-8";
      LC_TIME = "en_NZ.UTF-8";
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.hwtb = {
      isNormalUser = true;
      description = "hwtb";
      extraGroups = [
        "networkmanager"
        "wheel"
        "disk"
        "docker"
        "adbusers"
      ];
      packages = with pkgs; [ ];
      shell = pkgs.fish;
    };

    fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

    #### Hyprland ####
    programs.hyprland.enable = config.common.hyprlandEnable;
    programs.hyprlock.enable = config.common.hyprlandEnable;
    programs.waybar.enable = config.common.hyprlandEnable;

    services.hypridle.enable = config.common.hyprlandEnable;

    environment.sessionVariables = lib.mkMerge [
      (lib.mkIf config.common.hyprlandEnable {
        NIXOS_OZONE_WL = "1";
      })
    ];

    programs.xwayland.enable = true;
    #### Hyprland ####

    #### I3 ####
    services.xserver = lib.mkIf config.common.i3Enable {
      enable = true;

      displayManager = {
        startx.enable = true;
      };

      windowManager.i3 = {
        enable = true;
      };

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    programs.slock.enable = config.common.i3Enable;
    #### I3 ####

    # List packages installed in system profile.
    environment.systemPackages =
      with pkgs;
      [
        ripgrep
        bat
        eza
        dust
        fd
        bottom
        fzf
        difftastic
        vim
        git
        dos2unix

        alacritty
        zellij
        vscode
        devcontainer

        gcc
        clang
        clang-tools
        cmake

        rustup

        python313
        uv
        black
        python313Packages.python-lsp-server

        nixd
        nixfmt-rfc-style

        unstable.antigravity
        firefox
        librewolf
        nautilus
        mpv
        pavucontrol
        gnome-sound-recorder
        snapshot
        rpi-imager
      ]
      ++ lib.optionals config.common.hyprlandEnable [
        walker
        hyprpaper
        dunst
        grim
        slurp
      ]
      ++ lib.optionals config.common.i3Enable [
        xss-lock
        polybarFull
        rofi
        feh
        picom
        arandr
      ];

    programs.fish.enable = true;
    programs.zoxide.enable = true;

    services.udisks2.enable = true;

    virtualisation.docker.enable = true;

    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = [ "hwtb" ];
    virtualisation.libvirtd.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
    networking.firewall.extraCommands = ''
      iptables -A nixos-fw -p udp -d 224.0.0.0/4 -j ACCEPT
      iptables -A nixos-fw -p udp -s 224.0.0.0/4 -j ACCEPT
    '';

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
