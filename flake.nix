{
  description = "cooldev.in devshell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      name = "cooldev.in-dev";
      packages = with pkgs; [
        nodejs_23
      ];
    };
  };
}
