{
  config,
  pkgs,
  lib,
  options,
  ...
}: let
  cfg = config.boot.loader.grub.catppuccin;
in {
  options = {
    boot.loader.grub.catppuccin = {
      enable = lib.mkOption {
        default = false;
        example = true;
        type = lib.types.bool;
      };
    };
  };

  config = let
    n = "catppuccin-${config.catppuccin.theme}-grub-theme";
  in
    lib.mkIf cfg.enable {
      boot.loader.grub.theme = "${(pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
        }
        + "/src/${n}")}";
    };
}
