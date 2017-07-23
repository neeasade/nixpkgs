{ stdenv, fetchFromGitHub, libxcb }:

stdenv.mkDerivation rec {
  name = "wmutils-opt-${version}";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "neeasade";
    repo = "opt";
    rev = "c904c152bad6afd3a076e4de42a2e5c11eb1b469";
    sha256 = "05g0h1y6prv3dqlysf04a1ph90f5yy47gr924ssi7pv57r0z39d0";
  };

  buildInputs = [ libxcb ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with stdenv.lib; {
    description = "neeasade's border opt";
    homepage = https://github.com/wmutils/opt;
    license = licenses.isc;
    maintainers = with maintainers; [ vifino ];
    platforms = platforms.unix;
  };
}
