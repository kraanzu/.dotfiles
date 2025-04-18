let
  dp_edid = "00ffffffffffff001e6d715b01010101011a0104b5351e789f0331a6574ea2260d5054a54b80317c4568457c617c8168818081bc953cdf8880a070385a403020350055502100001e023a801871382d40582c4500132a2100001e000000fd003090a0a03c010a202020202020000000fc003237474c363530460a20202020014b020320f1230907074b010203041112131f903f0083010000e305c000e30605018048801871382d40582c4500132a2100001e866f80a07038404030203500132a2100001efe5b80a07038354030203500132a21000018011d007251d01e206e285500132a2100001e00000000000000000000000000000000000000000000003c";

  hdmi_edid = "00ffffffffffff0009d1e778010101012a20010380351e782e05f5a557529c270b5054a56b80d1c0b300a9c08180810081c001010101023a801871382d40582c45000f282100001e000000ff00455437414e3031353439534c30000000fd00324c1e5311000a202020202020000000fc0042656e51204757323438300a20010b020322f14f901f04130312021101140607151605230907078301000065030c001000023a801871382d40582c45000f282100001f011d8018711c1620582c25000f282100009f011d007251d01e206e2855000f282100001e8c0ad08a20e02d10103e96000f282100001800000000000000000000000000000000000000000003";

  fingerprints = {
    DisplayPort-1 = dp_edid;
    HDMI-A-0 = hdmi_edid;
  };
in
{
  services.autorandr = {
    enable = true;
    defaultTarget = "single-monitor";

    profiles = {
      "dual-monitor" = {
        fingerprint = fingerprints;
        config = {
          DisplayPort-1 = {
            enable = true;
            primary = true;
            position = "1080x420";
            mode = "1920x1080";
            rotate = "normal";
          };
          HDMI-A-0 = {
            enable = true;
            position = "0x0";
            mode = "1920x1080";
            rotate = "left";
          };
        };
      };

      "single-monitor" = {
        fingerprint = fingerprints;
        config = {
          DisplayPort-1 = {
            enable = true;
            primary = true;
            position = "1080x420";
            mode = "1920x1080";
            rotate = "normal";
          };
          HDMI-A-0 = {
            enable = false;
          };
        };
      };
    };
  };
}
