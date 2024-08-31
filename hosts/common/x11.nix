{
  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "us";
    };
  }

  services.picom = {
    enable = true;
    vSync = true;
  };

}
