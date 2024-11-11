{inputs, ...}: let
  wallpath = builtins.toString inputs.mywalls;
in {
  home.file = {
    "wallpapers" = {
      source = "${wallpath}";
      target = ".wallpapers";
    };
  };
}
