{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  imports = [
    "./helix"
  ];

  options = {
    catppuccin = {
      theme = mkOption {
        type = types.nullOr (types.enum ["latte" "frappe" "macchiato" "mocha"]);
        default = null;
        example = "mocha";
      };
    };
  };
}
