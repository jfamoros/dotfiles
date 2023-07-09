# Common configurations for desktop and laptop systems

{ config, pkgs, user, lib, ... }:

{
  imports = [
    ../config/bspwm/bspwm.nix
  ];

  services.pipewire = {
  	enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    audio.enable = true;
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    dejavu_fonts
    liberation_ttf
    source-code-pro
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
  ];

  environment.systemPackages = with pkgs; [
    firefox
    pavucontrol
    btop
    discord
    rofi
    nitrogen
    librewolf
    arandr
    barrier
    brightnessctl
  ];

  programs.steam = {
  	enable = true;
  };

  system.stateVersion = "23.05";
}
