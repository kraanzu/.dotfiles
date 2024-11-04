{
  packages,
  ...
}: {
  config = {
    environment.systemPackages = with packages; [
      # my projects
      # dooit
      smassh
    ];
  };
}
