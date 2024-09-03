let
  shadow_offset_x = -7;
  shadow_offset_y = -7;
in {
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

      # animations = {
      #   triggers = [ "open" ];
      #   offsetX = {
      #     duration = 2;
      #     start = 0;
      #     end = 100;
      #   };
      # };

      backend = "glx";
      ditheredPresent = false;
      vsync = true;
      detectRoundedCorners = true;
      detectClientOpacity = true;
      detectTransient = true;
      useDamage = true;

      rules = [
        {
          match = "window_type = 'tooltip'";
          fade = false;
          shadow = true;
          opacity = 0.75;
          fullShadow = false;
        }
        {
          match = "window_type = 'dock' || window_type = 'desktop' || _GTK_FRAME_EXTENTS@";
          blurBackground = false;
        }
        {
          match = "window_type != 'dock'";
        }
        {
          match = "window_type = 'dock' || window_type = 'desktop'";
          cornerRadius = 0;
        }
        {
          match = "name = 'Notification' || class_g = 'Conky' || class_g ?= 'Notify-osd' || class_g = 'Cairo-clock' || _GTK_FRAME_EXTENTS@";
          shadow = false;
        }
      ];
    };
  };
}
