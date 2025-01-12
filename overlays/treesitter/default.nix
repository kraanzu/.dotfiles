_: final: prev: {
  tree-sitter = prev.tree-sitter.overrideAttrs (oldAttrs: {
    version = "0.24.6";
    hash = "sha256-L7F2/S22knqEdB2hxfqLe5Tcgk0WQqBdFQ7BvHFl4EI=";
  });
}
