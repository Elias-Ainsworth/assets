{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "my-fonts";
  version = "latest";
  src = ./.;
  installPhase = ''
    mkdir -p $out/share/fonts
    install -Dm444 fonts/* $out/share/fonts/
  '';
  meta = with lib; {
    description = "Collection of fonts";
    homepage = "https://github.com/71zenith/assets";
    platforms = platforms.unix;
    maintainers = with maintainers; [zen];
  };
})
