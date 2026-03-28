{ lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types)
    attrsOf
    deferredModule
    lazyAttrsOf
    raw
    ;
in
{
  options.flake = {
    # Previously, machine modules are within nixosModules prefixed with "machine-"
    # Since all.nix dynamically imports all modules to place in scope, all machine
    # modules are unintentionally evaluated as they are not gated by an enabled option.
    nixosMachineModules = mkOption {
      type = attrsOf deferredModule;
      default = { };
      description = "NixOS machine configuration modules";
    };

    hjemModules = mkOption {
      type = attrsOf deferredModule;
      default = { };
      description = "Hjem modules for user-level packages";
    };

    hjemProfiles = mkOption {
      type = attrsOf deferredModule;
      default = { };
      description = "Hjem profiles that compose hjem modules to build user profiles";
    };

    lib = mkOption {
      type = lazyAttrsOf raw;
      default = { };
      description = "Library functions which require pkgs";
    };

  };
}
