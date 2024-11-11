{
  fileSystems."/drives/HDD" = {
    device = "/dev/disk/by-label/250GB";
    fsType = "ext4";
  };
  fileSystems."/drives/WIN10" = {
    device = "/dev/disk/by-label/win10";
    fsType = "ntfs";
  };
}
