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
        type = types.nullOr (types.enum ["latte" "frappe" "macchiato" "mocha"]);
        default = null;
        example = "mocha";
      };
    };
  };

  imports = [
    ./helix
  ];
}
