{
  description = "NixOS Deployments";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
	nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
	fw-pkgs.url = "github:fwastring/fwpkgs/main";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
	nixpkgs-unstable,
	fw-pkgs,
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
	overlay-fw-pkgs = final: prev: {
        fw-pkgs = import fw-pkgs {
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
        modules = [
			({nixpkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
			./maskiner/desktop/configuration.nix
		];
      };
      jobb = nixpkgs.lib.nixosSystem {
        specialArgs = {
			inherit inputs outputs;
			myhostname = "jobb";
		};
        modules = [./maskiner/jobb/configuration.nix];
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
        modules = [
			./config/home.nix
			({nixpkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
			({nixpkgs, ... }: { nixpkgs.overlays = [ overlay-fw-pkgs ]; })
		];
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
    };
  };
}
