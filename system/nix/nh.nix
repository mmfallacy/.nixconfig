{ pkgs, extras, ... }:
{
  programs.nh = {
    enable = true;

    clean.enable = true;
    clean.extraArgs = "--keep 3";

    # NOTE: nh does not propagate home-manager activation errors
    # https://github.com/nix-community/nh/issues/388
    package = extras.nh;
  };
}
