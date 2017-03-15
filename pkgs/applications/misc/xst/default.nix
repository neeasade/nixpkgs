{ stdenv, fetchFromGitHub, fetchurl, pkgconfig, writeText, libX11, ncurses, libXext, libXft
, fontconfig, conf ? null, patches ? []}:

with stdenv.lib;

let patches' = if isNull patches then [] else patches;
in stdenv.mkDerivation rec {
  name = "xst";

  src = fetchFromGitHub {
    owner   = "neeasade";
    repo    = "xst";

  rev= "11407c1d7c5053c4471a2d4354e604d7a3955772";
  sha256= "1f3xbj5zjb5d5c558kh2jj92vghyvxmiqspwmfg382zc0kcaxins";

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
