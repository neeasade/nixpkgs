{ stdenv, fetchFromGitHub, libxcb, libXinerama, sxhkd, xcbutil, xcbutilkeysyms, xcbutilwm }:

stdenv.mkDerivation rec {
  name = "bspwm-rolling";

  src = fetchFromGitHub {
    owner   = "baskerville";
    repo    = "bspwm";
    rev     =  "41dc94f63c1001be9716bc19228bf2c91eba68c8";
    sha256  = "1bawbl15w4qnjcn5lm22mlx65rmcmfnyfdykn9638n5yww0942kf";
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
