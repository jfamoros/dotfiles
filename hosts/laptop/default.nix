{ pkgs, ... } :

{
	imports = [ 
    ./hardware-configuration.nix
    ./autorandr.nix
  ];

  networking.hostName = "youmu";
   services.xserver = {
     videoDrivers = [ "nvidia" ];

     serverFlagsSection = ''
       Option "BlankTime" "0"
       Option "StandbyTime" "0"
       Option "SuspendTime" "0"
       Option "OffTime" "0"
     '';

     xrandrHeads = [
      {
        output = "eDP-1";
        primary = false;
      }
      {
        output = "HDMI-1-0";
        primary = true;
      }
    ];
  };
}
