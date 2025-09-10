{
  description = "fwastrings Nix-baserade konfigurationsfiler";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # fw-pkgs.url = "github:fwastring/fwpkgs/main";

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
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      # overlay-fw-pkgs = final: prev: {
      #   fw-pkgs = import fw-pkgs {
      #     inherit system;
      #     config.allowUnfree = false;
      #   };
      # };
    in
    {
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
          ];
        };
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "desktop";
          };
          modules = [
            ./maskiner/desktop/configuration.nix
          ];
        };
        jobb = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "jobb";
          };
          modules = [
            ./maskiner/jobb/configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
          ];
        };
        work-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "work-desktop";
          };
          modules = [
            ./maskiner/work-desktop/configuration.nix
          ];
        };
        macmini = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            myhostname = "macmini";
          };
          modules = [ ./maskiner/macmini/configuration.nix ];
        };
      };
    };
}
