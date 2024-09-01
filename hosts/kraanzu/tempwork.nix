{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodePackages.aws-cdk
  ];
}
