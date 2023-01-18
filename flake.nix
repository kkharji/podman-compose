{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, utils }:
    with utils.lib;
    eachSystem allSystems (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        defaultPackage = import ./default.nix pkgs;
        packages = flattenTree { podman-compose = self.defaultPackage."${system}"; };
        overlay = _: _: { podman-compose = self.defaultPackage."${system}"; };
        defaultApp = mkApp { drv = self.defaultPackage."${system}"; };
      });
}
