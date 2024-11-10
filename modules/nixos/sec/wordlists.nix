{pkgs, ...}: {
  config = {
    environment.systemPackages = [pkgs.wordlists];
    systemd.tmpfiles.settings = {
      "wordlists" = {
        "/sec/wordlists" = {
          L = {
            argument = "${pkgs.wordlists}/share/wordlists";
          };
        };
      };
    };
  };
}
