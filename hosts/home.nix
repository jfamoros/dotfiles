{ user, pkgs, ... } :

{
  imports = [
    ../config/kitty/kitty.nix
    ../config/zsh.nix
    ../config/bspwm/home.nix
    ../config/grobi.nix
  ];

	home = {
		username = "${user}";
		homeDirectory = "/home/${user}";

		packages = with pkgs; [
		];

		stateVersion = "23.05";
	};
}
