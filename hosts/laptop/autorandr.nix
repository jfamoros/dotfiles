{ pkgs, ... } :

{
  services.autorandr = {
    defaultTarget = "dual-mon";
    profiles = {
      "standalone" = {
        fingerprint = {
          eDP-1 = "00ffffffffffff0030e4fe0500000000001c0104a5221378eae085a3544e9b260e5054000000010101010101010101010101010101015e8780a070384d403020350058c21000001b683880a070384d403020350058c21000001b00000000000000000000000000000000000000000002000c30f20f3c962e12309e0000000083";
        };
        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "1920x1080";
            rate = "144.0";
          };
          HDMI-1-0 = {
            enable = false;
          };
        };
      };

      "dual-mon" = {
        fingerprint = {
          eDP-1 = "00ffffffffffff0030e4fe0500000000001c0104a5221378eae085a3544e9b260e5054000000010101010101010101010101010101015e8780a070384d403020350058c21000001b683880a070384d403020350058c21000001b00000000000000000000000000000000000000000002000c30f20f3c962e12309e0000000083";
          HDMI-1-0 = "00ffffffffffff003669a73f37433030251d0103803c22782a1ad5ae5048a625125054bfcf00d1c0714f81c0814081809500b3000101565e00a0a0a029503020350055502100001e59e7006aa0a067501520350055502100001e000000fd0030901ede3c000a202020202020000000fc004d5349204d4147323731435152018002033771530102031112130f1d1e0e901f044b4c05143f40230917078301000065030c00200067d85dc401788800681a000001013090e66fc200a0a0a055503020350055502100001a5a8700a0a0a03b503020350055502100001a000000000000000000000000000000000000000000000000000000000000000000000000d1";
        };
        config = {
          eDP-1 = {
            enable = true;
            position = "0x0";
            mode = "1920x1080";
            rate = "144.0";
          };
          HDMI-1-0 = {
            enable = true;
            primary = true;
            position = "1920x0";
            mode = "2560x1440";
            rate = "143.97";
          };
        };
      };
    };

    hooks.postswitch = {
      "reload-nitrogen" = ''
        ${pkgs.nitrogen}/bin/nitrogen --restore
        for monitor in $(bspc query -M)
        do
            # set the workspaces on each monitor to 1-9
            bspc monitor $monitor -d 1 2 3 4 5 6 7 8 9
        done
      '';
    };
  };
}
