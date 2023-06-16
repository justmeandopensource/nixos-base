{ config, pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;
      exportConfiguration = true;
      layout = "gb";
      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
          greeters.mini = {
            enable = true;
            user = "alice";
            extraConfig = ''
              [greeter]
              show-password-label = false
              password-alignment = left
              [greeter-theme]
              border-width = 1px
              window-color = "#403f3f"
              password-color = "#a19f9f"
              password-border-width = 1px
            '';
          };
        };
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
      libinput = {
        enable = true;
        touchpad.naturalScrolling = true;
      };
    };
  };

  environment.pathsToLink = [ "/libexec" ];

}

