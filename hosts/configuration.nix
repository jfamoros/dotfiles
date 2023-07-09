{ config, pkgs, user, lib, ... }:

{
  nix = {
	  settings.auto-optimise-store = true;
	  gc = {
		  automatic = true;
		  dates = "weekly";
		  options = "--delete-older-than 7d";
	  };

	  package = pkgs.nixFlakes;
	  extraOptions = "experimental-features = nix-command flakes";
  };

  # Bootloader.
  boot = {
	  kernelPackages = pkgs.linuxPackages_latest;

	  loader = {
		  systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
		  efi.canTouchEfiVariables = true;
		  timeout = 3;
	  };
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  environment.pathsToLink = [ "/share/zsh" ];
  environment.sessionVariables = rec {
    XDG_CACHE_HOME          = "$HOME/.cache";
    XDG_CONFIG_HOME         = "$HOME/.config";
    XDG_DATA_HOME           = "$HOME/.local/share";
    XDG_STATE_HOME          = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    	    = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "calvo maricon";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  	git
    gcc
    unzip
    neovim
    btop
    pciutils
    killall
    pfetch
  ];

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = false;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
  	24800  # Barrier
  ];

  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  #home-manager.users.${user} = { pkgs, ... }: {
  #	home.stateVersion = "23.05";
  #      home.packages = with pkgs; [
  #      	feh
  #      ];
  #};

  system.stateVersion = "23.05";
}
