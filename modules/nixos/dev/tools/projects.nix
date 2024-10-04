{
  pkgs,
  ...
}: {
  config = {
    environment.systemPackages = with pkgs; [
      # my projects
      dooit
      smassh
    ];
  };
}
