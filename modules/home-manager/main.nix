{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  };

  primary_user = "alice";

in

{

  imports = [
      (import "${home-manager}/nixos")
  ];

  home-manager.users.${primary_user} = {

    home.file = {
      ".gnupg/gpg-agent.conf".text = "pinentry-program /run/current-system/sw/bin/pinentry";
    };

    xdg.configFile = {
      "libvirt/libvirt.conf".text = "uri_default = 'qemu:///system'";
    };

    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        fzf-vim
        gruvbox
        nerdtree
        nerdtree-git-plugin
        vim-airline
        vim-commentary
        vim-fugitive
        vim-gitgutter
        vim-indent-guides
        vim-merginal
        vimwiki
      ];
    };

    home.pointerCursor = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
    };

    home.stateVersion = "23.05";

  };

}

