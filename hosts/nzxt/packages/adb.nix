{ pkgs, ... }: {
  programs.adb.enable = true;
  users.users.kraanzu.extraGroups = ["adbusers"];

  environment.systemPackages = [ pkgs.android-studio ];
}
