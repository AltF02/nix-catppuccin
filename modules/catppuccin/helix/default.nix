{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.programs.helix.catppuccin;
in {
  options = {
    programs.helix.catppuccin = {
      enable = mkOption {
        default = false;
        example = true;
        type = types.bool;
      };
      # TODO: Add no_italics
    };
  };

  config = let
    tn = "catppuccin_${config.options.catppuccin}";
  in
    lib.mkIf cfg.enable {
      programs.helix = {
        themes."${tn}" = builtins.readFile (pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "helix";
            rev = "549327c8e091140f5c8f8e0bbd83004bf148712f";
          }
          + "/themes/default/${tn}.toml");

        settings.theme = tn;
      };
    };
}
