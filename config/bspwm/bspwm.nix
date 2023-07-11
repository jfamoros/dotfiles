{ config, lib, pkgs, user, ... }:

{
  services.xserver = {
    enable = true;
    autorun = true;
    exportConfiguration = true;
    layout = "us";
    xkbVariant = "";
    autoRepeatInterval = 20;
    autoRepeatDelay = 200;

    displayManager = {
      defaultSession = "none+bspwm";
      #autoLogin.enable = true;
      #autoLogin.user = "${user}";
      lightdm.enable = true;
      lightdm.greeters.enso.enable = true;
    };

    windowManager.bspwm.enable = true;
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
        accelSpeed = "0";
      };
    };
  }; 

  environment.systemPackages = with pkgs; [       # Packages installed
  ];
}
