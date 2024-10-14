{inputs}:
let
  inherit (inputs) nixpkgs R;
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
      (R "/modules/system/base.nix")
      (R "/modules/system/grub.nix")
      (R "/modules/audio/pipewire.nix")
      ./hardware-configuration.nix
      ./user.nix
      {
        config.modules.grub.enable = true;
        config.modules.pipewire.enable = true;
      }
    ];
  }
