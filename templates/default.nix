{ pkgs, lib, ... }:
let
  dir = ./.;
in
dir
|> builtins.readDir
|> lib.mapAttrs' (
  path: type:
  if type != "directory" then
    lib.nameValuePair path null
  else
    lib.nameValuePair path {
      path = dir + "/${path}";
      welcomeText =
        let
          readmePath = dir + "/${path}/README.md";
        in
        if builtins.pathExists readmePath then
          builtins.readFile readmePath
        else
          ''
            # `.nixconfig` sample template
          '';
    }
)
# Filter all null attrsets (non-nix or ignored directories)
|> lib.filterAttrsRecursive (k: v: v != null)
