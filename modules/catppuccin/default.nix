{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  imports = [
    ./grub
    ./plymouth
    ./sddm
  ];
}
