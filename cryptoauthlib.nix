with import <nixpkgs> {};
stdenv.mkDerivation rec {
  pname = "cryptoauthlib";
  version = "3.2.1";

  src = pkgs.fetchFromGitHub {
    owner = "MicrochipTech";
    repo = "cryptoauthlib";
    rev = "9bb492dea8996b5585f20076f528718176383c7f";
    sha256 = "42qP3d8OQR31pWjxZWCuQ4q27JWvtIutzO4xcf0IeUg=";
  };

  cmakeFlags = [
    "-DACTA_LIBRARY_CONF=/etc/cryptoauthlib/cryptoauthlib.conf"
    "-DACTA_PLATFORM_FREE=free"
    "-DACTA_PLATFORM_MALLOC=malloc"
    "-DATCA_OPENSSL=ON"
    "-DATCA_PKCS11=ON"
    "-DATCA_TFLEX_SUPPORT=ON"
    "-DATCA_TNGLORA_SUPPORT=ON"
    "-DATCA_TNGTLS_SUPPORT=ON"
    "-DATCA_TNG_LEGACY_SUPPORT=ON"
    "-DATCA_USE_ATCAB_FUNCTIONS=ON"
    "-DATCA_HAL_KIT_HID=ON"
  ];

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    pkgs.openssl
  ];

  installPhase = ''
    make DESTDIR=$out install
  '';

}
