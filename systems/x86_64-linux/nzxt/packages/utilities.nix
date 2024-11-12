{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    anydesk
    simplescreenrecorder
    protonvpn-cli_2
  ];
}
