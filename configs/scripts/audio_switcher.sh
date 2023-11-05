if grep '^connected$' /sys/class/drm/card1/card1-HDMI*/status ;then             
  sleep 2
  pacmd set-card-profile 0 output:hdmi-stereo
else
  sleep 2
  pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
fi
