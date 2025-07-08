{
  lib,

  ...
}:
with lib.mynix;
let
  user_name = "kraanzu";
  user_email = "kraanzu@gmail.com";
in
{
  mynix = {
    desktop = {
      rofi = enabled;
      dunst = enabled;
      picom = enabled;
      wallpapers = enabled;
      nord_theme = enabled;
    };
    browsers = {
      firefox = enabled;
      brave = enabled;
      edge = enabled;
    };
    media.all = enabled;

    dev.apps.all = enabled;
    dev.lang = {
      cpp = enabled;
      go = enabled;
      python = enabled;
      lua = enabled;
      markdown = enabled;
      nix = enabled;
      rust = enabled;
    };

    sec = enabled;
  };

  xdg = {
    mimeApps = enabled;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.git = {
    enable = true;
    userEmail = "${user_email}";
    userName = "${user_name}";
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      s = "status -s";
      d = "diff";
      dc = "diff --cached";
      aa = "add --all";
      cm = "commit -m";
      pushf = "push --force-with-lease";
      pullr= "pull --rebase";
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
