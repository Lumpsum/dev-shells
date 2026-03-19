{
  description = "Essent infra dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.essent-infra = pkgs.mkShell {
          packages = [
            pkgs.tflint
            pkgs.terraform-ls
            pkgs.yaml-language-server
          ];
        };
      });
}

