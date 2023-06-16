{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    alacritty
    awscli2
    bc
    bitwarden
    bitwarden-cli
    brightnessctl
    chromium
    dbeaver
    dmenu
    docker-compose
    dunst
    firefox
    flameshot
    fusuma
    fzf
    gimp
    git
    gnucash
    gruvbox-dark-gtk
    gtk-engine-murrine
    inetutils
    jq
    keyutils
    killall
    leafpad
    libnotify
    libreoffice
    libsForQt5.qtstyleplugins
    lm_sensors
    mplayer
    mpv
    msmtp
    neomutt
    networkmanagerapplet
    notmuch
    papirus-icon-theme
    pass
    pavucontrol
    picom
    pinentry
    powerline
    qutebrowser
    ranger
    rclone
    redshift
    rofi
    rofi-calc
    silver-searcher
    simplescreenrecorder
    ssm-session-manager-plugin
    teams
    tmux
    tree
    unzip
    vagrant
    vim
    virt-manager
    virt-viewer
    vym
    w3m
    wget
    xdotool
    xournalpp
    yewtube
    zathura
    zoxide
    zsh-powerlevel10k
    ( python3.withPackages
      ( ps: with ps; [
          colored
          GitPython
          humanize
          icalendar
          paramiko
          pyfiglet
          python-vagrant
          requests
          setuptools
          scp
          tabulate
         ]
      )
    )
    (
      let
        polybar = pkgs.polybar.override {
          pulseSupport = true;
        };
      in
      polybar
    )
  ];

  programs = {
    dconf.enable = true;
    gnupg.agent.enable = true;
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [ "aws" ];
      };
      shellInit = "[ -e $HOME/.zshrc-custom ] && source $HOME/.zshrc-custom";
    };
  };

  environment.etc = {
    hosts.mode = "0644";
    "powerlevel10k/powerlevel10k.zsh-theme".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  virtualisation = {
    docker = {
      enable = true;
    };
    libvirtd.enable = true;
    lxd.enable = true;
    virtualbox = {
      host = {
        enable = true;
      };
    };
  };

  nixpkgs.config = {
    packageOverrides = super: {
      mplayer = super.mplayer.override {
        v4lSupport = true;
      };
    };
  };

}

