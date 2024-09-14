{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    discord
    telegram-desktop
  ];
}
