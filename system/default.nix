{ ... }:
{
  audio.pipewire = ./audio/pipewire.nix;
  boot.grub = ./boot/grub.nix;
  locales = import ./locales;
  login.gdm = ./login/gdm.nix;
  login.ly = ./login/ly.nix;
  wm.gnome = ./wm/gnome.nix;
  wm.niri = ./wm/niri.nix;
  base = ./base.nix;
}
