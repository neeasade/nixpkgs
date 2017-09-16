{ stdenv, fetchFromGitHub, libxcb, libXinerama, sxhkd, xcbutil, xcbutilkeysyms, xcbutilwm }:

stdenv.mkDerivation rec {
  name = "bspwm-rolling";

  src = fetchFromGitHub {
    owner   = "baskerville";
    repo    = "bspwm";
    rev     =  "a46496835c24e3a58ecdc94b289d92d037992119";
    sha256  = "11jhzk4q9zw6vhcr9yg24aqrx9v5y5d7bjg33hxkkxflmndsj218";
  };

  buildInputs = [ libxcb libXinerama xcbutil xcbutilkeysyms xcbutilwm ];

  buildPhase = ''
    make PREFIX=$out
  '';

  installPhase = ''
    make PREFIX=$out install
  '';

  meta = {
    description = "A tiling window manager based on binary space partitioning (git version)";
    homepage = https://github.com/baskerville/bspwm;
    maintainers = [ stdenv.lib.maintainers.meisternu stdenv.lib.maintainers.epitrochoid ];
    license = stdenv.lib.licenses.bsd2;
    platforms = stdenv.lib.platforms.linux;
  };
}
