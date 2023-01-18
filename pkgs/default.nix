{
  inputs,
  pkgs,
}: let
  inherit (pkgs) callPackage;

  packages = rec {
    catppuccin-plymouth = callPackage ./catppuccin-plymouth {};
  };
in
  packages
