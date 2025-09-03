{
  description = "Advanced example of Nix-on-Droid system config with home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    #nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # nvf - modern, reproducible, portable, declarative neovim framework
    #obsidian-nvim.url = "github:epwalsh/obsidian.nvim";
    nvf = {
      url = "github:NotAShelf/nvf";
      # You can override the input nixpkgs to follow your system's
      # instance of nixpkgs. This is safe to do as nvf does not depend
      # on a binary cache.
      inputs.nixpkgs.follows = "nixpkgs";
      # Optionally, you can also override individual plugins
      # for example:
      #inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
    };
    
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-on-droid,
      nvf,
      ...
    }@inputs:
    {	

      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        modules = [
          ./nix-on-droid.nix

          # list of extra modules for Nix-on-Droid system
          # { nix.registry.nixpkgs.flake = nixpkgs; }
          # ./path/to/module.nix

          # or import source out-of-tree modules like:
          # flake.nixOnDroidModules.module
        ];

        # list of extra special args for Nix-on-Droid modules
        extraSpecialArgs = {
          # rootPath = ./.;
          inherit inputs ;
        };

        # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
        pkgs = import nixpkgs {
          system = "aarch64-linux";

          overlays = [
            nix-on-droid.overlays.default
            # add other overlays
          ];
        };

	/*pkgs-stable = import inputs.nixpkgs-stable {
          system = "aarch64-linux";
                                                                          overlays = [                                                      nix-on-droid.overlays.default                                   # add other overlays
          ];
        };*/


        # set path to home-manager flake
        home-manager-path = home-manager.outPath;
      };

    };
}
