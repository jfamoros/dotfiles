{ config, lib, pkgs, user, ... }:

{
  services.xserver = {
    enable = true;
    autorun = true;
    exportConfiguration = true;
    layout = "us";
    xkbVariant = "";
    autoRepeatInterval = 70;
    autoRepeatDelay = 200;

    displayManager = {
      defaultSession = "none+bspwm";
      autoLogin.enable = true;
      autoLogin.user = "${user}";
      lightdm.enable = true;
      lightdm.greeters.enso.enable = true;
    };

    windowManager.bspwm.enable = true;
    libinput.enable = true;
  }; 

  environment.systemPackages = with pkgs; [       # Packages installed
  ];
}
