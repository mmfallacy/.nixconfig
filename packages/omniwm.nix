{
  perSystem =
    {
      system,
      pkgs,
      ...
    }:
    {
      packages.omniwm =
        if system != "aarch64-darwin" then
          throw "this flake only uses BarutSRB/OmniWM for aarch64-darwin"
        else
          pkgs.callPackage (import ./_omniwm.package.nix) { };
    };
}
