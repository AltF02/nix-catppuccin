{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options = {
    catppuccin = {
      palette = mkOption {
        type = types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        example = "mocha";
      };
    };
  };

  imports = [
    ./helix
  ];
}
