{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ./modules/apps/main.nix
    ./modules/desktop_environment/main.nix
    ./modules/users/main.nix
    ./modules/home-manager/main.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "acpi_mask_gpe=0x6E" ];

  networking.hostName = "gram";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system = {
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
    stateVersion = "23.05";
  };

}

