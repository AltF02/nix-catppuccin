{
  config,
  pkgs,
  lib,
  options,
  ...
}: let
  cfg = config.programs.alacritty.catppuccin;
in {
  options = {
    programs.alacritty.catppuccin = {
      enable = lib.mkOption {
        default = false;
        example = true;
        type = lib.types.bool;
      };
      # TODO: Add no_italics
    };
  };

  config = let
    n = "catppuccin-${config.catppuccin.palette}";
    loc = "alacritty/catppuccin/${n}.yml";
  in
    lib.mkIf cfg.enable {
      programs.alacritty.settings.import = [ xdg.configFile."${loc}".target ];

      xdg.configFile."${loc}".source =
        pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "alacritty";
          rev = "3c808cbb4f9c87be43ba5241bc57373c793d2f17";
          sha256 = "sha256-w9XVtEe7TqzxxGUCDUR9BFkzLZjG8XrplXJ3lX6f+x0=";
        }
        + "/${n}.yaml";
    };
}

