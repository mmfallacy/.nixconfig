{ lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types)
    lazyAttrsOf
    raw
    ;
in
{
  options.flake = {
    flakeup = mkOption {
      type = lazyAttrsOf raw;
      default = { };
      description = "flakeup templates";
    };
  };
}
