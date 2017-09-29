{ stdenv, fetchFromGitHub, libxcb, libXinerama, sxhkd, xcbutil, xcbutilkeysyms, xcbutilwm }:

stdenv.mkDerivation rec {
  name = "bspwm-rolling";

  src = fetchFromGitHub {
    owner   = "baskerville";
    repo    = "bspwm";
    rev     = "d953f6fa7f1836590c59c9882d70919144a168e3";
    sha256  = "1cbfk5pmm9s4845b6v1ywayjqz3nvp0jhhsaycypbzc2b10lwp1p";
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
