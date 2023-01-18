{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "catppuccin-plymouth";
  version = "0.0.1";

  src = builtins.fetchTarball {
    url = "https://github.com/catppuccin/plymouth/archive/d4105cf336599653783c34c4a2d6ca8c93f9281c.tar.gz";
    sha256 = "sha256-quBSH8hx3gD7y1JNWAKQdTk3CmO4t1kVo4cOGbeWlNE=";
  };

  buildInputs = [
    pkgs.git
  ];

  configurePhase = ''
    mkdir -p $out/share/plymouth/themes/
  '';

  buildPhase = ''
  '';

  installPhase = ''
    cp -r themes/* / $out/share/plymouth/themes/
    for theme in plymouth/themes/*/*.plymouth; do mkdir -p $out/share/plymouth/themes/$(basename "$theme" .plymouth) && cat $theme | sed  "s@\/usr\/@$out\/@" > $out/share/plymouth/themes/$(basename "$theme" .plymouth)/$(basename $theme); done
  '';
}
