{ user, pkgs, ... } :

{
  imports = [
    ../config/kitty/kitty.nix
    ../config/zsh.nix
    ../config/bspwm/home.nix
  ];

	home = {
		username = "${user}";
		homeDirectory = "/home/${user}";

		packages = with pkgs; [
		];

    pointerCursor = {     # This will set cursor system-wide so applications can not choose their own
      gtk.enable = true;
      name = "Dracula-cursors";
      #name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.dracula-theme;
      #package = pkgs.catppuccin-cursors.mochaDark;
      size = 16;
    };

		stateVersion = "23.05";
	};

  gtk = {                                     # Theming
    enable = true;
    theme = {
      name = "Dracula";
      #name = "Catppuccin-Dark";
      package = pkgs.dracula-theme;
      #package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrains Mono Medium";         # or FiraCode Nerd Font Mono Medium
    };                                        # Cursor is declared under home.pointerCursor
  };
}
