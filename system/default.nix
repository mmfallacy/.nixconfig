{...}: {
  imports = [
    ./base.nix

    ./audio/pipewire.nix
    ./boot/grub.nix
    ./de/gnome.nix
    ./login/gdm.nix
    ./misc/gnupg.nix
  ];
}
