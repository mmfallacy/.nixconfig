# Require pkgs and lib (so lib/default.nix can wire it first)
{ pkgs, lib }:

# The directory where we want to start recursing
directory:
let
  hasFile = file: dir: dir |> builtins.readDir |> builtins.hasAttr file;
  hasIgnore = hasFile ".noautowire";
  # This file contains line of POSIX Extended RegEx; File names that match these expressions are automatically ignored from autowiring
  # Note that autowires only apply to siblings. It checks for filename matching only and doesn't match the whole path.
  autowireIgnore = ".autowireignore";
  hasIgnoreList = hasFile autowireIgnore;
  hasDefault = hasFile "default.nix";
  getExt = name: builtins.elemAt (lib.splitString "." name) 1;
  getName = name: builtins.head (lib.splitString "." name);
  regexMatch = name: regex: builtins.isList (builtins.match regex name);
  matchIgnores = name: ignoreList: builtins.any (regexMatch name) ignoreList;
  nv = lib.nameValuePair;
  recurse =
    dir: ignores:
    dir
    |> builtins.readDir
    |> lib.mapAttrs' (
      fname: type:
      let
        next = dir + "/${fname}";
      in
      # Should ignore due to autowireignore? return { fname = null }
      if matchIgnores fname ignores then
        nv fname null

      # Process directories
      else if type == "directory" then
        # Should ignore due to .noautowire? return { dirname  = null }
        if hasIgnore next then
          nv fname null
        # Has default? return { dirname = path_to_directory };
        else if hasDefault next then
          nv fname next
        # Recurse!
        else if hasIgnoreList next then
          let
            ignoreList =
              "${next}/${autowireIgnore}"
              |> builtins.readFile
              |> builtins.split "[\n]+"
              # Remove empty strings and capture groups
              |> builtins.filter (el: !builtins.isList el && el != "");
          in
          nv fname (recurse next ignoreList)
        else
          nv fname (recurse next [ ])

      # Process normal files
      else if type == "regular" then
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
      else
        throw "Unsupported file type! Not \"regular\" or \"directory\"."
    )
    # Filter all null attrsets (non-nix or ignored directories)
    |> lib.filterAttrsRecursive (k: v: v != null);
in
recurse directory [ ]

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
