{ config, pkgs, ... }:

{

  imports = [
    ./window_manager.nix
  ];

  fonts.fonts = with pkgs; [
    dejavu_fonts
    font-awesome
    jetbrains-mono
    meslo-lgs-nf
    noto-fonts
    roboto
  ];

  environment.variables = {
    EDITOR = "vim";
    QT_QPA_PLATFORMTHEME = "gtk2";
  };

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "5%";
    };
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };

}

