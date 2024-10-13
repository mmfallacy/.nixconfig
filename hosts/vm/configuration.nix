{inputs}:
with inputs;
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
  lib.nixosSystem {
    inherit system;
    modules = [
      ../../modules/system/base.nix
      ../../modules/system/grub.nix
      ../../modules/audio/pipewire.nix
      ./hardware-configuration.nix
      ./user.nix
      {
        config.modules.grub.enable = true;
        config.modules.pipewire.enable = true;
      }
    ];
  }
