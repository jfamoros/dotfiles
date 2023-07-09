{ pkgs, ... }:
{
  services.grobi = {
    enable = true;
    rules = [
      {
        name = "docked";
        outputs_connected = [ "eDP-1" "HDMI-1-0" ];
        atomic = true;
        configure_row = [ "eDP-1" "HDMI-1-0" ];
        primary = "HDMI-1-0";
        execute_after = [
          "${pkgs.nitrogen}/bin/nitrogen --restore"
        ];
      }
      {
        name = "undocked";
        outputs_disconnected = [ "HDMI-1-0" ];
        configure_single = "eDP-1";
        primary = true;
        atomic = true;
        execute_after = [
          "${pkgs.nitrogen}/bin/nitrogen --restore"
        ];
      }
      {
        name = "fallback";
        configure_single = "eDP-1";
      }
    ];
  };
}
