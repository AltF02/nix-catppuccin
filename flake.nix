{
  description = "Catppuccin theme nix packages";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosModules.catppuccin.helix = import ./modules/catppuccin/helix/default.nix;
  };
}
