{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.mynix.x11.enable {
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-power-menu
        rofi-emoji
      ];
      extraConfig = {
        modes = "window,drun,run,ssh,combi,calc,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      };

      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          "al" = mkLiteral "#00000000";
          "bg" = mkLiteral "#252a34ff";
          "se" = mkLiteral "#8fbcbbff";
          "fg" = mkLiteral "#d8dee9cc";
          "ac" = mkLiteral "#8fbcbbff";
          "red" = mkLiteral "#bf616aff";
          "green" = mkLiteral "#a3be8cff";
          "yellow" = mkLiteral "#ebcb8bff";
          "blue" = mkLiteral "#88c0d0ff";
          "purple" = mkLiteral "#b48eadff";
          "cyan" = mkLiteral "#4DD0E1ff";
        };

        "*" = {
          "background-color" = mkLiteral "@bg";
        };

        "window" = {
          "border" = mkLiteral "0px";
          "border-color" = mkLiteral "@ac";
          "border-radius" = mkLiteral "6px";
          "padding" = mkLiteral "15";
          "width" = mkLiteral "350";
        };

        "prompt" = {
          "spacing" = mkLiteral "0";
          "border" = mkLiteral "0";
          "text-color" = mkLiteral "@fg";
        };

        "textbox-prompt-colon" = {
          "expand" = mkLiteral "false";
          "str" = mkLiteral "\" \"";
          "margin" = mkLiteral "0px 4px 0px 0px";
          "text-color" = mkLiteral "inherit";
        };

        "entry" = {
          "spacing" = mkLiteral "0";
          "text-color" = mkLiteral "@fg";
        };

        "case-indicator" = {
          "spacing" = mkLiteral "0";
          "text-color" = mkLiteral "@fg";
        };

        "inputbar" = {
          "spacing" = mkLiteral "0px";
          "text-color" = mkLiteral "@fg";
          "padding" = mkLiteral "1px";
          "children" = map mkLiteral ["prompt" "textbox-prompt-colon" "entry" "case-indicator"];
        };

        "mainbox" = {
          "border" = mkLiteral "0px";
          "border-color" = mkLiteral "@ac";
          "padding" = mkLiteral "6";
        };

        "listview" = {
          "lines" = mkLiteral "6";
          "columns" = mkLiteral "1";
          "fixed-height" = mkLiteral "0";
          "border" = mkLiteral "0px";
          "border-color" = mkLiteral "@ac";
          "spacing" = mkLiteral "4px";
          "scrollbar" = mkLiteral "false";
          "padding" = mkLiteral "5px 5px 0px 5px";
        };

        "element-text" = {
          "background-color" = mkLiteral "#00000000";
          "text-color" = mkLiteral "inherit";
        };

        "element-icon" = {
          "background-color" = mkLiteral "#00000000";
          "text-color" = mkLiteral "inherit";
        };

        "element" = {
          "border" = mkLiteral "0px";
          "border-radius" = mkLiteral "4px";
          "padding" = mkLiteral "5px";
        };

        "element normal.normal" = {
          "background-color" = mkLiteral "@bg";
          "text-color" = mkLiteral "@fg";
        };

        "element normal.urgent" = {
          "background-color" = mkLiteral "@bg";
          "text-color" = mkLiteral "@red";
        };

        "element normal.active" = {
          "background-color" = mkLiteral "@green";
          "text-color" = mkLiteral "@bg";
        };

        "element selected.normal" = {
          "background-color" = mkLiteral "@fg";
          "text-color" = mkLiteral "@bg";
        };

        "element selected.urgent" = {
          "background-color" = mkLiteral "@bg";
          "text-color" = mkLiteral "@red";
        };

        "element selected.active" = {
          "background-color" = mkLiteral "@fg";
          "text-color" = mkLiteral "@bg";
        };

        "element alternate.normal" = {
          "background-color" = mkLiteral "@bg";
          "text-color" = mkLiteral "@fg";
        };

        "element alternate.urgent" = {
          "background-color" = mkLiteral "@bg";
          "text-color" = mkLiteral "@fg";
        };

        "element alternate.active" = {
          "background-color" = mkLiteral "@bg";
          "text-color" = mkLiteral "@fg";
        };

        "sidebar" = {
          "border" = mkLiteral "0px";
          "border-color" = mkLiteral "@ac";
          "border-radius" = mkLiteral "0px";
        };

        "button" = {
          "horizontal-align" = mkLiteral "0.5";
          "vertical-align" = mkLiteral "0.5";
          "background-color" = mkLiteral "@fg";
          "margin" = mkLiteral "5px";
          "padding" = mkLiteral "5px";
          "text-color" = mkLiteral "@bg";
          "border" = mkLiteral "0px";
          "border-radius" = mkLiteral "4px";
          "border-color" = mkLiteral "@fg";
        };

        "button selected" = {
          "background-color" = mkLiteral "@ac";
          "text-color" = mkLiteral "@fg";
          "border" = mkLiteral "0px";
          "border-radius" = mkLiteral "4px";
          "border-color" = mkLiteral "@fg";
        };

        "scrollbar" = {
          "width" = mkLiteral "4px";
          "border" = mkLiteral "0px";
          "handle-color" = mkLiteral "@fg";
          "handle-width" = mkLiteral "8px";
          "padding" = mkLiteral "0";
        };

        "message" = {
          "border" = mkLiteral "0px";
          "border-color" = mkLiteral "@ac";
          "padding" = mkLiteral "1px";
        };

        "textbox" = {
          "text-color" = mkLiteral "@fg";
        };
      };
    };
  };
}
