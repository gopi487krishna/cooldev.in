{
  description = "Quartz devshell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      name = "quartz-dev";
      packages = with pkgs; [
        nodejs-18_x
        npm
        nodePackages.npm
        nodePackages.npx
      ];
    };
  };
}
