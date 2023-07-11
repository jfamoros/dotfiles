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
      autoLogin.enable = true;
      autoLogin.user = "${user}";
      lightdm = {
        enable = true;
        extraConfig = "logind-check-graphical=true";
        greeters.enso.enable = true;
      };
      #sessionCommands = ''
      #  xrandr --output HDMI-1-0 --set "PRIME Synchronization" 1
      #  autorandr -c
      #'';
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
