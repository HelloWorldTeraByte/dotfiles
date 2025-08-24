{ config, pkgs, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
  mkDotfilesSymlink = true;
  mkDotfile =
    {
      mkSymlink,
      path,
      absPath,
    }:
    if mkSymlink then config.lib.file.mkOutOfStoreSymlink absPath else path;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hwtb";
  home.homeDirectory = "/home/hwtb";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/hypr".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./hypr/.config/hypr;
      absPath = "${dotfilesDir}/hypr/.config/hypr";
    };
    ".config/waybar".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./waybar/.config/waybar;
      absPath = "${dotfilesDir}/waybar/.config/waybar";
    };
    ".config/dunst".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./dunst/.config/dunst;
      absPath = "${dotfilesDir}/dunst/.config/dunst";
    };

    ".config/i3".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./i3/.config/i3;
      absPath = "${dotfilesDir}/i3/.config/i3";
    };
    ".config/polybar".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./polybar/.config/polybar;
      absPath = "${dotfilesDir}/polybar/.config/polybar";
    };
    ".config/rofi".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./rofi/.config/rofi;
      absPath = "${dotfilesDir}/rofi/.config/rofi";
    };
    ".config/picom".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./picom/.config/picom;
      absPath = "${dotfilesDir}/picom/.config/picom";
    };

    ".config/alacritty".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./alacritty/.config/alacritty;
      absPath = "${dotfilesDir}/alacritty/.config/alacritty";
    };
    ".config/zellij".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./zellij/.config/zellij;
      absPath = "${dotfilesDir}/zellij/.config/zellij";
    };
    ".config/helix".source = mkDotfile {
      mkSymlink = mkDotfilesSymlink;
      path = ./helix/.config/helix;
      absPath = "${dotfilesDir}/helix/.config/helix";
    };


    ".xinitrc".text = ''
      exec i3
    '';

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hwtb/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    HELIX_RUNTIME = "$HOME/programs/helix/runtime";
  };

  home.sessionPath = [ "$HOME/programs/helix/target/release" ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fish = {
    enable = true;

    shellAbbrs = {
      ls = "eza";
      cd = "z";
      cdi = "zi";
      cat = "bat";

      hxf = ''hx $(fzf -m --preview="bat --color=always {}")'';
      fzfp = ''fzf --multi --preview="bat --color=always {}"'';

      gs = "git status";
      gd = "git diff";
      gds = "git diff --staged";
    };

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      # Catppuccin Mocha
      set fish_color_normal cdd6f4
      set fish_color_command 89b4fa
      set fish_color_param f2cdcd
      set fish_color_keyword f38ba8
      set fish_color_quote a6e3a1
      set fish_color_redirection f5c2e7
      set fish_color_end fab387
      set fish_color_comment 7f849c
      set fish_color_error f38ba8
      set fish_color_gray 6c7086
      set fish_color_selection --background=313244
      set fish_color_search_match --background=313244
      set fish_color_option a6e3a1
      set fish_color_operator f5c2e7
      set fish_color_escape eba0ac
      set fish_color_autosuggestion 6c7086
      set fish_color_cancel f38ba8
      set fish_color_cwd f9e2af
      set fish_color_user 94e2d5
      set fish_color_host 89b4fa
      set fish_color_host_remote a6e3a1
      set fish_color_status f38ba8
      set fish_pager_color_progress 6c7086
      set fish_pager_color_prefix f5c2e7
      set fish_pager_color_completion cdd6f4
      set fish_pager_color_description 6c7086
    '';
  };
}
