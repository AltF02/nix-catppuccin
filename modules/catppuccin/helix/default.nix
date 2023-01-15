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
      enable = lib.mkEnableOption;
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
          rev = "00bd462e8fab5f74490335dcf881ebe7784d23fa";
          sha256 = "yzn+1IXxQaKcCK7fBdjtVohns0kbN+gcqbWVE4Bx7G8=";
        }
        + "/themes/default/${tn}.toml");
      };

      theme = tn;
    };
}
