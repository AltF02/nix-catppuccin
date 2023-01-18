{
  description = "Catppuccin theme nix packages";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = inputs @ {
    self,
    nixpkgs,
  }: {
    desktopModules.catppuccin = import ./home/modules/catppuccin;
    desktopModules.default = inputs.self.desktopModules.catppuccin;

    nixosModules.catppuccin = import ./modules/catppuccin;
    nixosModules.default = inputs.self.nixosModules.catppuccin;
  };
}
