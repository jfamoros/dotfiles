{ pkgs, ... } :

{
  programs.kitty = {
    enable = true;
    font.size = 11;
    font.name = "DejaVu Sans";
    extraConfig = ''
      scrollback_lines                 100000
      mouse_hide_wait                  0
      close_on_child_death             yes
      enable_audio_bell                no
      strip_trailing_spaces            always

      window_margin_width 10

      cursor                           #d2d4de
      foreground                       #d3d4de
      background                       #1c1e26

      # black
      color0                           #1c1e26
      color8                           #1c1e26

      # red
      color1                           #ec6a88
      color9                           #e95678

      # green
      color2                           #09f7a0
      color10                          #27d796

      # yellow
      color3                           #fab795
      color11                          #ecac73

      # blue
      color4                           #25b0bc
      color12                          #6bdfe6

      # magenta
      color5                           #b877db
      color13                          #b16286

      # cyan
      color6                           #e95678
      color14                          #95c4ce

      # white
      color7                           #d3d4de
      color15                          #d2d4de

      confirm_os_window_close 0
    '';
  };
}
