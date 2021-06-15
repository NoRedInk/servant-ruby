sourceSelector:

let
  sources = import ./sources.nix { };
  nivOverlay = _: pkgs: {
    niv = (import sources.niv { }).niv; # use the sources :)
  };
  servant-oidcOverlay = _: pkgs: {
    servant-oidc = pkgs.haskellPackages.callCabal2nix "servant-ruby" ../. { };
  };
in import (sourceSelector sources) { overlays = [ nivOverlay servant-oidcOverlay ]; }
