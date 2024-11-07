{
  inputs,
  ...
}: {
  environment.systemPackages = [
    inputs.dooit.packages.x86_64-linux.default
  ];
}
