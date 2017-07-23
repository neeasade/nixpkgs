{ stdenv, fetchFromGitHub, libxcb, libXinerama, sxhkd, xcbutil, xcbutilkeysyms, xcbutilwm }:

stdenv.mkDerivation rec {
  name = "bspwm-rolling";

  src = fetchFromGitHub {
    owner   = "baskerville";
    repo    = "bspwm";
    rev     =  "9ce48c468ba161eccf605b9070dbfe51f74d6d82";
    sha256  = "00a005rdkx8225zzljl772b1gdy1s2ip7krsi8g8bajvk30a4k4i";
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
