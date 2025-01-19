# Require pkgs and lib (so lib/default.nix can wire it first)
{ pkgs, lib }:

# Autowire function
# Given a directory, returns an attribute set mimicking the directory's tree
# i.e. Given the ./animal directory:
# -- animal/
# ----- fish.nix
# ----- mammal/
# -------- cow.nix
# ----- snake/
# -------- default.nix
# -------- README.md
# Get
# {
#   animal = {
#     fish = import ./fish.nix;
#     mammal = {
#       cow = import ./mammal/cow.nix;
#     };
#     snake = import ./snake;
#   };
# }

directory:
let
  hasFile = file: dir: dir |> builtins.readDir |> builtins.hasAttr file;
  hasIgnore = hasFile ".noautoignore";
  hasDefault = hasFile "default.nix";
  getExt = name: builtins.elemAt (lib.splitString "." name) 1;
  getName = name: builtins.head (lib.splitString "." name);
  nv = lib.nameValuePair;
  recurse =
    dir:
    dir
    |> builtins.readDir
    |> lib.mapAttrs' (
      fname: type:
      let
        next = dir + "/${fname}";
      in
      if type == "directory" then
        # Should ignore? return { dirname  = null }
        if hasIgnore next then
          nv fname null
        # Has default? return { dirname = path_to_directory };
        else if hasDefault next then
          nv fname next
        # Recurse!
        else
          nv fname (recurse next)
      else
        let
          name = getName fname;
          ext = getExt fname;
        in
        # Strip extension from name
        # Is not nix file? Ignore by returning { file = null }
        if ext != "nix" then
          nv name null
        # return { file = path_to file }
        else
          nv name next
    )
    # Filter all null attrsets (non-nix or ignored directories)
    |> lib.filterAttrsRecursive (k: v: v != null);
in
recurse directory
