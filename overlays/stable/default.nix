{ inputs, ... }:
final: _prev: {
  stable = import inputs.nixpkgs-stable {
    inherit (final) system;
    config.allowUnfree = true;
  };
}
