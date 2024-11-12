{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonvpn-cli_2
  ];
}
