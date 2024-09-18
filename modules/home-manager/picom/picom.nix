let
  shadow_offset_x = -7;
  shadow_offset_y = -7;
in {
  config = {
    services.picom = {
      enable = true;
      settings = {
        shadow = true;
        shadowRadius = 7;
        shadowOffsets = [shadow_offset_x shadow_offset_y];
        shadowColor = "#2e3440";

        fading = false;
        fadeDelta = 2;
        noFadingOpenClose = true;

        frameOpacity = 0.7;
        inactiveDimFixed = true;

        cornerRadius = 0;

        blur = {
          method = "gaussian";
          size = 20;
          deviation = 5.0;
        };
        blurBackground = true;
        blurKern = "3x3box";

        backend = "glx";
        ditheredPresent = false;
        vsync = true;
        detectRoundedCorners = true;
        detectClientOpacity = true;
        detectTransient = true;
        useDamage = true;

        shadow-exclude = [
          "QTILE_INTERNAL:32c = 1"
        ];

        wintypes = {
          tooltip = {
            fade = false;
            shadow = true;
            opacity = 0.75;
            "full-shadow" = false;
          };
          dock = {
            "blur-background" = false;
            "corner-radius" = 0;
            shadow = false;
          };
          desktop = {
            "blur-background" = false;
            "corner-radius" = 0;
            shadow = false;
          };
          notification = {
            shadow = false;
          };
          dropdown_menu = {
            opacity = 1;
            "blur-background" = false;
            shadow = false;
          };
          popup_menu = {
            opacity = 1;
            "blur-background" = false;
            shadow = false;
          };
          unknown = {
            opacity = 1;
            "blur-background" = false;
            shadow = false;
          };
        };
      };
    };
  };
}
