{mywalls, ...}: let
  wallpath = builtins.toString mywalls;
in {
  home.file = {
    "wallpapers" = {
      source = "${wallpath}";
      target = ".wallpapers";
    };
  };
}
