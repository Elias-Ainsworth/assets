{
  description = "My Wallpapers";

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
      my-walls = pkgs.callPackage ./default.nix {};
    in {
      packages = {
        inherit my-walls;
        default = my-walls;
      };
    })
    // {
      overlays = rec {
        default = my-walls;
        my-walls = final: prev: {
          my-walls = self.packages."${final.system}".my-walls;
        };
      };
    };
}
