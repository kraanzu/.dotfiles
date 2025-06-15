{
  colors = {
    draw_bold_text_with_bright_colors = true;

    bright = {
      black = "#4c566a";
      blue = "#81a1c1";
      cyan = "#8fbcbb";
      green = "#a3be8c";
      magenta = "#b48ead";
      red = "#bf616a";
      white = "#eceff4";
      yellow = "#ebcb8b";
    };

    cursor = {
      cursor = "#d8dee9";
      text = "#2e3440";
    };

    dim = {
      black = "#373e4d";
      blue = "#68809a";
      cyan = "#6d96a5";
      green = "#809575";
      magenta = "#8c738c";
      red = "#94545d";
      white = "#aeb3bb";
      yellow = "#b29e75";
    };

    normal = {
      black = "#3b4252";
      blue = "#81a1c1";
      cyan = "#88c0d0";
      green = "#a3be8c";
      magenta = "#b48ead";
      red = "#bf616a";
      white = "#e5e9f0";
      yellow = "#ebcb8b";
    };

    primary = {
      background = "#2e3440";
      dim_foreground = "#a5abb6";
      foreground = "#d8dee9";
    };

    search.matches = {
      background = "#88c0d0";
      foreground = "CellBackground";
    };

    selection = {
      background = "#4c566a";
      text = "CellForeground";
    };

    vi_mode_cursor = {
      cursor = "#d8dee9";
      text = "#2e3440";
    };
  };

  env = {
    TERM = "xterm-256color";
  };

  font = {
    size = 15;

    bold = {
      family = "JetBrainsMono Nerd Font";
      style = "Bold";
    };

    bold_italic = {
      family = "JetBrainsMono Nerd Font";
      style = "Bold Italic";
    };

    glyph_offset = {
      x = 0;
      y = 2;
    };

    italic = {
      family = "JetBrainsMono Nerd Font";
      style = "Italic";
    };

    normal = {
      family = "JetBrainsMono Nerd Font";
      style = "SemiBold";
    };

    offset = {
      x = 0;
      y = 4;
    };
  };

  keyboard.bindings = [
    {
      action = "Paste";
      key = "V";
      mods = "Control|Shift";
    }
    {
      action = "Copy";
      key = "C";
      mods = "Control|Shift";
    }
    {
      action = "PasteSelection";
      key = "Insert";
      mods = "Shift";
    }
    {
      action = "ResetFontSize";
      key = "Key0";
      mods = "Control";
    }
    {
      action = "IncreaseFontSize";
      key = "Equals";
      mods = "Control";
    }
    {
      action = "IncreaseFontSize";
      key = "Plus";
      mods = "Control";
    }
    {
      action = "DecreaseFontSize";
      key = "Minus";
      mods = "Control";
    }
    {
      action = "Paste";
      key = "Paste";
    }
    {
      action = "Copy";
      key = "Copy";
    }
    {
      action = "ClearLogNotice";
      key = "L";
      mods = "Control";
    }
    {
      chars = "\\f";
      key = "L";
      mods = "Control";
    }
    {
      action = "ScrollPageUp";
      key = "PageUp";
      mode = "~Alt";
      mods = "Shift";
    }
    {
      action = "ScrollPageDown";
      key = "PageDown";
      mode = "~Alt";
      mods = "Shift";
    }
    {
      action = "ScrollToTop";
      key = "Home";
      mode = "~Alt";
      mods = "Shift";
    }
    {
      action = "ScrollToBottom";
      key = "End";
      mode = "~Alt";
      mods = "Shift";
    }
  ];

  scrolling.history = 5000;

  window = {
    opacity = 1;
    title = "Alacritty";

    class = {
      general = "Alacritty";
      instance = "Alacritty";
    };

    padding = {
      x = 6;
      y = 6;
    };
  };
}
