# nix-build -E 'with import <nixpkgs> { }; callPackage ./lcm.nix { }'
{ lib, buildGo126Module, fetchFromGitHub }:
buildGo126Module rec {
    pname = "openlcmd";
    version = "v0.0.2";

    # src = fetchFromGitHub {
    #     owner = "arsenier";
    #     repo = "lcm";
    #     rev = "main";
    #     sha256 = "sha256-ekEtwM+Bc5pKHZznPuqHo0KJOrlYYT83ckiQfT4mfks=";
    # };
    src = ./.;

    modRoot = ".";

    vendorHash = "sha256-TMk/wEn2TKG0OC9doiUURoGansq/PfmMFcIqKYLr0Cc=";
    # vendorHash = null;

    subPackages = [ "cmd/openlcmd" ];

    meta = with lib; {
        description = "Implementation of the ASUSTOR NAS LCD serial port communication protocol";
        homepage = "https://github.com/arsenier/lcm";
        license = licenses.mit;
        maintainers = [];
    };
}
