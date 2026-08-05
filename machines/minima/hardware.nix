{
  flake.nixosMachineModules.minima =
	{ config, lib, pkgs, modulesPath, ... }:
	{
	  imports =
	    [ (modulesPath + "/profiles/qemu-guest.nix")
	    ];

	  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
	  boot.initrd.kernelModules = [ ];
	  boot.kernelModules = [ "kvm-amd" ];
	  boot.extraModulePackages = [ ];

	  fileSystems."/" =
	    { device = "/dev/disk/by-uuid/33c68bf4-32c5-4535-8f1d-51e2e41e0feb";
	      fsType = "ext4";
	    };

	  swapDevices = [ ];

	  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	};
}
