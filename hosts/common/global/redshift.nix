{
  services.redshift = {
    enable = true;
    temperature = {
      day = 4000;
      night = 4000;
    };
  };
}
