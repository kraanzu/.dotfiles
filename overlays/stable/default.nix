{ inputs, ... }:
final: _prev: {
  stable = import inputs.nixpkgs-stable {
    system = final.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
}
