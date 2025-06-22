{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.dev.apps;
in
{
  options.mynix.dev.apps = {
    all.enable = mkBoolOpt false "Enable all editors";

    alacritty.enable = mkBoolOpt false "Enable Alacritty";
    wezterm.enable = mkBoolOpt false "Enable WezTerm";

    neovim.enable = mkBoolOpt false "Enable Neovim";
    postman.enable = mkBoolOpt false "Enable Postman";

    code-cursor.enable = mkBoolOpt false "Enable Cursor IDE";
    vscode.enable = mkBoolOpt false "Enable VSCode";
    zed.enable = mkBoolOpt false "Enable Zed";
  };

  config = {
    home.packages = with pkgs; [
      (mkIf (cfg.alacritty.enable || cfg.all.enable) alacritty)
      (mkIf (cfg.code-cursor.enable || cfg.all.enable) code-cursor)
      (mkIf (cfg.postman.enable || cfg.all.enable) postman)
      (mkIf (cfg.vscode.enable || cfg.all.enable) vscode)
      (mkIf (cfg.wezterm.enable || cfg.all.enable) wezterm)
      (mkIf (cfg.zed.enable || cfg.all.enable) zed-editor)
    ];

    programs.neovim = mkIf (cfg.neovim.enable || cfg.all.enable) {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        python3Packages.debugpy
        nodejs_22 # copilot
        ctags # toggle bar
        gcc # Treesiter
      ];
    };

    services.gnome-keyring = mkIf (cfg.zed.enable || cfg.all.enable) {
      enable = true;
      components = [
        "pkcs11"
        "secrets"
        "ssh"
      ];
    };
  };
}
