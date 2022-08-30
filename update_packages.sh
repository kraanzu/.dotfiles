# fill packages.txt except nvidia
yay -Qqe | grep -v "nvidia" > packages.txt
