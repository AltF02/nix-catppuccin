{
  description = "Catppuccin theme nix packages";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosModules.catppuccin = import ./modules/catppuccin;
    nixosModules.default = inputs.self.nixosModules.catppuccin;
 };
}
