{ stdenv, fetchFromGitHub, fetchurl, pkgconfig, writeText, libX11, ncurses, libXext, libXft
, fontconfig, conf ? null, patches ? []}:

with stdenv.lib;

let patches' = if isNull patches then [] else patches;
in stdenv.mkDerivation rec {
  name = "xst";

  src = fetchFromGitHub {
    owner   = "neeasade";
    repo    = "xst";
    rev= "a32b4452762af7d744af711780277a6002617eec";
    sha256= "12xllmnw4lpbswnqi83hjj82vfa6qfy9biaaqp3f1x51d8lgms22";
  };

  buildInputs = [ pkgconfig libX11 ncurses libXext libXft fontconfig ];

  installPhase = ''
    TERMINFO=$out/share/terminfo make install PREFIX=$out
  '';

  meta = {
    homepage = http://st.suckless.org/;
    license = stdenv.lib.licenses.mit;
    maintainers = with maintainers; [viric andsild];
    platforms = platforms.linux;
  };
}
