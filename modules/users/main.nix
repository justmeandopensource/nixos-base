{ config, pkgs, ... }:

let
  primary_user = "alice";
in

{

  users.users.${primary_user} = {
    isNormalUser = true;
    initialPassword = "password";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "vboxusers" "lxd" "libvirtd" "docker" "audio" "input" ];
  };

  security.sudo.extraRules= [
    {  users = [ "${primary_user}" ];
       commands = [
         { command = "ALL" ;
           options= [ "NOPASSWD" ];
         }
       ];
    }
  ];

}

