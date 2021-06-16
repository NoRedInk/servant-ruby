let
  pkgs = (import nix/packages.nix) (sources: sources.nixpkgs);
  pkgs2105 = (import nix/packages.nix) (sources: sources.nixpkgs-2105);
in pkgs.mkShell {
  buildInputs = [
    pkgs.pkgs.ghc
    pkgs.pcre
    pkgs.niv
    pkgs.nixfmt
    pkgs.servant-oidc
    pkgs2105.servant-oidc
  ];
}
