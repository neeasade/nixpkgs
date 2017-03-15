{ stdenv, fetchFromGitHub, libxcb, libXinerama, sxhkd, xcbutil, xcbutilkeysyms, xcbutilwm }:

stdenv.mkDerivation rec {
  name = "bspwm-rolling";

  src = fetchFromGitHub {
    owner   = "baskerville";
    repo    = "bspwm";
    rev= "047a9ecfcc9bcccc4b80f7a259e3f0deaec2760f";
    sha256= "1a4aj2lyirzbp0zfjvfy6w2ry5nasna2ib671r3cy6as9flwifjy";
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
