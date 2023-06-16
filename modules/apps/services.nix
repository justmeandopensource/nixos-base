{ config, pkgs, ... }:

{

  services = {
    avahi = {
      enable = true;
      nssmdns = true;
    };
    blueman.enable = true;
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.cnijfilter2 ];
    };
    upower.enable = true;
    vnstat.enable = true;
  };

}
