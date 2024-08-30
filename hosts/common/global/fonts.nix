{pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["SourceCodePro"];})
  ];
}
