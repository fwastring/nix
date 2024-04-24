{
  description = "NixOS Deployments";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
	nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-gaming.url = "github:fufexan/nix-gaming";
	sops-nix.url = "github:Mic92/sops-nix";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
	nixpkgs-unstable,
	sops-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
	system = "x86_64-linux";
	overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
			inherit system;
          config.allowUnfree = true;
        };
      };
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
			inherit inputs outputs;
			myhostname = "laptop";
		};
        modules = [
		./maskiner/laptop/configuration.nix
			sops-nix.nixosModules.sops
		];
      };
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
			inherit inputs outputs;
			myhostname = "desktop";
		};
        modules = [./maskiner/desktop/configuration.nix];
      };
      jobb = nixpkgs.lib.nixosSystem {
        specialArgs = {
			inherit inputs outputs;
			myhostname = "jobb";
		};
        modules = [./maskiner/jobb/configuration.nix];
      };
      server = nixpkgs.lib.nixosSystem {
        specialArgs = {
			inherit inputs outputs;
			myhostname = "server";
		};
		inherit system;
        modules = [
			({nixpkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
			./maskiner/server/configuration.nix
		];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "fw@laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
			inherit inputs outputs;
			myhostname = "laptop";
		};
        modules = [./config/home.nix];
      };
      "fw@desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
			inherit inputs outputs;
			myhostname = "desktop";
		};
        # > Our main home-manager configuration file <
        modules = [./config/home.nix];
      };
      "fw@jobb" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
			inherit inputs outputs;
			myhostname = "jobb";
		};
        # > Our main home-manager configuration file <
        modules = [./config/home.nix];
      };
      "fw@server" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
			inherit inputs outputs;
			myhostname = "server";
		};
        # > Our main home-manager configuration file <
        modules = [./config/server.nix];
      };
    };
  };
}
