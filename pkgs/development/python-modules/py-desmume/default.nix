{
  lib,
  alsa-lib,
  buildPythonPackage,
  fetchFromGitHub,
  gitpython,
  libpcap,
  meson,
  ninja,
  openal,
  pillow,
  pkg-config,
  pygobject3,
  pythonOlder,
  SDL2,
  soundtouch,
}:

buildPythonPackage rec {
  pname = "py-desmume";
  version = "0.0.7";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "SkyTemple";
    repo = "py-desmume";
    tag = version;
    hash = "sha256-aH7f/BI89VLUGqwA8Y7ThSpmKxWffYRETT/+EjPVTg8=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    alsa-lib
    gitpython
    libpcap
    openal
    SDL2
    soundtouch
  ];

  propagatedBuildInputs = [
    pillow
    pygobject3
  ];

  hardeningDisable = [ "format" ];

  doCheck = false; # there are no tests

  pythonImportsCheck = [ "desmume" ];

  meta = with lib; {
    description = "Python library to interface with DeSmuME, the Nintendo DS emulator";
    homepage = "https://github.com/SkyTemple/py-desmume";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ marius851000 ];
  };
}
