{
  description = "My Wallpapers & Fonts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      my-walls = pkgs.callPackage ./walls.nix {};
      my-fonts = pkgs.callPackage ./fonts.nix {};
    in {
      packages = {
        inherit my-walls my-fonts;
      };
    })
    // {
      overlays = rec {
        default = my-assets;
        my-assets = final: prev: {
          my-walls = self.packages."${final.system}".my-walls;
          my-fonts = self.packages."${final.system}".my-fonts;
        };
      };
    };
}
