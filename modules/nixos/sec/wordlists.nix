{pkgs, ...}: {
  config = {
    environment.systemPackages = [pkgs.wordlists];
  };
}
