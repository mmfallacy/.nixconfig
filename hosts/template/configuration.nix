{ mylib, ... } @ inputs: let
  inherit (mylib) R userFactory;
  mkUser = userFactory ./users;
in
{
  imports = [
    (R "/system")
  ];

  config = {
    # Virtualization
    virtualisation.vmware.guest.enable = true;

    sysmodules = {
        pipewire.enable = true;
        grub.enable = true;
        gnome.enable = true;
        gdm.enable = true;
        gnupg.enable = true;
    };

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = {inherit inputs;};
  } // mkUser "user" "User";
}
