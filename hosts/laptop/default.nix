{ pkgs, ... } :

{
	imports = [ ./hardware-configuration.nix ];

  networking.hostName = "youmu";
   services.xserver = {
     videoDrivers = [ "nvidia" ];

     serverFlagsSection = ''
       Option "BlankTime" "0"
       Option "StandbyTime" "0"
       Option "SuspendTime" "0"
       Option "OffTime" "0"
     '';
   };
}
