{
  description = "fwastrings Nix-baserade konfigurationsfiler";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
	  sops-nix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        legacy = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "legacy";
          };
          modules = [
            ./maskiner/legacy/configuration.nix
          ];
        };
        node = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "node";
          };
          modules = [
            ./maskiner/node/configuration.nix
			sops-nix.nixosModules.sops
          ];
        };
        core = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "core";
          };
          modules = [
            ./maskiner/core/configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
			sops-nix.nixosModules.sops
          ];
        };
        archive = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "archive";
          };
          modules = [ ./maskiner/archive/configuration.nix ];
        };
      };
    };
}
