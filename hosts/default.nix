{ lib, system, home-manager, user, ... } :

{
	laptop = lib.nixosSystem {
		inherit system;
		specialArgs = { inherit user; };
		modules = [
			./laptop
			./configuration.nix
      ./common.nix

			home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = { inherit user; };
				home-manager.users.${user} = {
					imports = [ 
						./home.nix
						./laptop/home.nix
					];
					home.stateVersion = "23.05";
				};
			}
		];
  };
    
	desktop = lib.nixosSystem {
		inherit system;
		specialArgs = { inherit user; };
		modules = [
			./desktop
			./configuration.nix
      ./common.nix

			home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = { inherit user; };
				home-manager.users.${user} = {
					imports = [ 
						./home.nix
						./desktop/home.nix
					];
					home.stateVersion = "23.05";
				};
			}
		];
	};

	server = lib.nixosSystem {
		inherit system;
		specialArgs = { inherit user; };
		modules = [
			./server
			./configuration.nix

			home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = { inherit user; };
				home-manager.users.${user} = {
					imports = [ 
						./home.nix
						./server/home.nix
					];
					home.stateVersion = "23.05";
				};
			}
		];
	};
}
