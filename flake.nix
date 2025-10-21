{
  description = "undetecteed selenium example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            (pkgs.writeShellScriptBin "google-chrome" "exec -a $0 ${pkgs.chromium}/bin/chromium $@")
            (pkgs.writeShellScriptBin "uc" "exec -a $0 ${pkgs.undetected-chromedriver}/bin/undetected-chromedriver $@")
          ];
          shellHook = ''
            		export TMPDIR=/tmp
            		export DIRENV='selenium'
          '';

          nativeBuildInputs = with pkgs; [ chromedriver ];
          buildInputs = with pkgs; [
            python313
            python313Packages.selenium
          ];
        };
      }
    );
}
