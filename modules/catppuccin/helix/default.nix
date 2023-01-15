{
  config,
  pkgs,
  lib,
  options,
  ...
}: let
  cfg = config.programs.helix.catppuccin;
in {
  options = {
    programs.helix.catppuccin = {
      enable = lib.mkOption {
        default = false;
        example = true;
        type = lib.types.bool;
      };
      # TODO: Add no_italics
    };
  };

  config = let
    n = "catppuccin_${config.catppuccin.theme}";
  in
    lib.mkIf cfg.enable {
      programs.helix.settings.theme = n;

      xdg.configFile."helix/themes/${n}.toml".source =
        pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "helix";
          rev = "549327c8e091140f5c8f8e0bbd83004bf148712f";
          sha256 = "sha256-8z4MMoOZrn3TUi1J/oOwqtVOypvaxszZyzRcPgmh2Jo=";
        }
        + "/themes/default/${n}.toml";
    };
}
