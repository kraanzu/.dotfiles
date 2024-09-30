{pkgs, ...}: {
  config = {
    environment.systemPackages = with pkgs; [
      wezterm
      alacritty
    ];
  };
}
