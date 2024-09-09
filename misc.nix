{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "my-misc";
  version = "latest";
  src = ./.;
  installPhase = ''
    mkdir -p $out/share/misc
    install -Dm444 active/* $out/share/misc
  '';
  meta = with lib; {
    description = "Collection of miscellanious files";
    homepage = "https://github.com/Elias-Ainsworth/assets";
    platforms = platforms.unix;
    maintainers = with maintainers; [Elias Ainsworth];
  };
})
