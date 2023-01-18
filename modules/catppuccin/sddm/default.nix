{
  config,
  pkgs,
  lib,
  options,
  ...
}: let
  cfg = config.services.xserver.displayManager.sddm.catppuccin;
in {
  options = {
    programs.services.xserver.displayManager.sddm.catppuccin = {
      enable = lib.mkOption {
        default = false;
        example = true;
        type = lib.types.bool;
      };

      palette = lib.mkOption {
        type = types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        example = "mocha";
      };
    };
  };

  config = let
    n = "catppuccin-${cfg.palette}";
  in
    lib.mkIf cfg.enable {
      services.xserver.displayManager.sddm.theme = "${(pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "sddm";
          rev = "bde6932e1ae0f8fdda76eff5c81ea8d3b7d653c0";
        }
        + "/src/${n}")}";
    };
}
