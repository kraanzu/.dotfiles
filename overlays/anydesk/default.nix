{ ... }:
final: prev: {
  anydesk = prev.anydesk.overrideAttrs (old: {
    src = prev.fetchurl {
      url = "https://download.anydesk.com/linux/anydesk-${old.version}-amd64.tar.gz";
      hash = "sha256-zS5P2eyTHZY7cBW8mQ2Q6M0lXcx9VZZTtpG3Bb6u7IQ=";
    };
  });
}
