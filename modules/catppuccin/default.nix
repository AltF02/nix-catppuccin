{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options = {
    catppuccin = {
      theme = mkOption {
        type = types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        example = "mocha";
      };
    };
  };

  imports = [
    ./grub
    ./helix
    ./sddm
  ];
}
