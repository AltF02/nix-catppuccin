{
  description = "Catppuccin theme nix packages";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: let
    inherit (nixpkgs) lib;
    inherit inputs;
    genSystems = lib.genAttrs [
      # Add more systems if they are supported
      "aarch64-linux"
      "x86_64-linux"
    ];

    pkgsFor = nixpkgs.legacyPackages;
  in {
    overlays.default = _: prev:
      import ./pkgs {
        inherit inputs;
        pkgs = prev;
      };

    packages = genSystems (system:
      (self.overlays.default null pkgsFor.${system})
      // {});

    desktopModules.catppuccin = import ./home/modules/catppuccin;
    desktopModules.default = inputs.self.desktopModules.catppuccin;

    nixosModules.catppuccin = import ./modules/catppuccin;
    nixosModules.default = inputs.self.nixosModules.catppuccin;
  };
}
