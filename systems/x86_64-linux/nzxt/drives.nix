{

  fileSystems."/drives/WIN" = {
    device = "/dev/disk/by-uuid/7476F42376F3E430";
    fsType = "ntfs";
    options = [
      "defaults"
      "nofail"
    ];
  };

  fileSystems."/drives/HDD" = {
    device = "/dev/disk/by-uuid/f7ff91fe-2871-4f4f-9297-0d6df5235f85";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };
}
