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

  buildInputs = [
    pkgs.cmake
  ];

  PREFIX = placeholder "out";

  configurePhase = ''
    mkdir build
    cd build
    cmake -DATCA_PKCS11:STRING=ON -DATCA_HAL_I2C=ON ..
  '';

  installPhase = ''
    make DESTDIR=$out install
  '';

}
