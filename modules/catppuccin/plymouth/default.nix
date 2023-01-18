{
  config,
  pkgs,
  lib,
  options,
  ...
}: let
  cfg = config.boot.plymouth.catppuccin;
in {
  options = {
    boot.plymouth.catppuccin = {
      enable = lib.mkOption {
        default = false;
        example = true;
        type = lib.types.bool;
      };

      palette = lib.mkOption {
        type = lib.types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        example = "mocha";
      };
    };
  };

  config = let
    n = "catppuccin-${cfg.palette}";
  in
    lib.mkIf cfg.enable {
      boot.plymouth.themePackages = [ "${(pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "plymouth";
          rev = "d4105cf336599653783c34c4a2d6ca8c93f9281c";
          sha256 = "sha256-quBSH8hx3gD7y1JNWAKQdTk3CmO4t1kVo4cOGbeWlNE=";
        }
        + "/themes/${n}")}" ];

      boot.plymouth.theme = n;
    };
}
