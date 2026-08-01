{ lib, ... }:
{
  flake.lib = rec {
    allTrue = list: lib.all (x: x) list;
    mkIfAllTrue = conds: attrs: lib.mkIf (allTrue conds) attrs;
  };
}
