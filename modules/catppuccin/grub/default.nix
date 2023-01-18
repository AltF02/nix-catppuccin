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

      palette = lib.mkOption {
        type = lib.types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        example = "mocha";
      };
    };
  };

  config = let
    n = "catppuccin-${cfg.palette}-grub-theme";
  in
    lib.mkIf cfg.enable {
      boot.loader.grub.theme = "${(pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
          sha265 = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
        }
        + "/src/${n}")}";
    };
}
