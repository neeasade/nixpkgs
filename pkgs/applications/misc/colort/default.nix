{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "colort";

  src = fetchFromGitHub {
    owner   = "neeasade";
    repo    = "colort";
    rev= "8470190706f358dc807b4c26ec3453db7f0306b6";
    sha256= "10n8rbr2h6hz86hcx73f86pjbbfiaw2rvxsk0yfajnma7bpxgdxw";
  };

 installPhase = ''
    make install PREFIX=$out
  '';


  meta = {
    description = "colort";
    homepage = https://github.com/neeasade/colort;
    license = stdenv.lib.licenses.gpl3Plus;
    maintainers = [ stdenv.lib.maintainers.eelco ];
    platforms = stdenv.lib.platforms.all;
  };
}
