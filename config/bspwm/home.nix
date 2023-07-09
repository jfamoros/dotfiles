{ pkgs, ... }:

{
  xsession.windowManager.bspwm = {
    enable = true;
    rules = {
      "Pavucontrol" = {
        state = "floating";
        sticky = true;
      };
    };
    extraConfig = ''
      nitrogen --restore &

      bspc config border_width                  4
      bspc config window_gap                    20
      bspc config single_monocle                false
      bspc config split_ratio                   0.50
      bspc config borderless_monocle            true
      bspc config gapless_monocle               true
      bspc config focus_follows_pointer         true
      bspc config remove_disabled_monitors      true
      bspc config merge_overlapping_monitors    true
      bspc config pointer_modifier mod4
      bspc config pointer_action1 move
      bspc config pointer_action2 resize_side
      bspc config pointer_action3 resize_corner

      bspc config normal_border_color        "#4c566a"
      bspc config active_border_color		     "#1e1e1e"
      bspc config focused_border_color	     "#5e81ac"
      bspc config presel_feedback_color	     "#5e81ac"

      for monitor in $(bspc query -M)
      do
          # set the workspaces on each monitor to 1-9
          bspc monitor $monitor -d 1 2 3 4 5 6 7 8 9
      done
    '';
  };

  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + Return" = "kitty";
      "super + d" = "rofi -show drun";
      "super + shift + q" = "bspc node -c";
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
      "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} focused:'^{1-9,10}'";
    };
  };
}
