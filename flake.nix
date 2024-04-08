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

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
	nixpkgs-unstable,
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
      nix-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./maskiner/laptop/configuration.nix];
      };
      nix-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./maskiner/desktop/configuration.nix];
      };
      fw-jobb = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./maskiner/jobb/configuration.nix];
      };
      server = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
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
      "fw@nix-laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
			inherit inputs outputs;
			myhostname = "nix-laptop";
		};
        modules = [./config/home.nix];
      };
      "fw@nix-desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
			inherit inputs outputs;
			myhostname = "nix-desktop";
		};
        # > Our main home-manager configuration file <
        modules = [./config/home.nix];
      };
      "fw@fw-jobb" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
			inherit inputs outputs;
			myhostname = "fw-jobb";
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
