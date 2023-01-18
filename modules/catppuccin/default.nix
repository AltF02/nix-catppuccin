{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  imports = [
    ./grub
    ./sddm
  ];
}
