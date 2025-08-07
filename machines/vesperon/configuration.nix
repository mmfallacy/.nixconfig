{
  units,
  extras,
  pkgs,
  ...
}:
let
  # profiles = import ../../profiles;
  # inherit (profiles) mmfallacy;
  # inherit (mmfallacy.const) username name;
  inherit (units.profiles) mmfallacy;
  inherit (mmfallacy.const) username name;

  # Vesperon is a VMWare Guest which runs the current iteration (2025) of .nixconfig
  HOSTNAME = "vesperon";
in
{
  imports = [
    units.system.base
    units.system.nix.nix
    units.system.audio.pipewire
    units.system.boot.grub
    units.system.locales.en_PH
    # units.system.login.gdm
    # units.system.wm.gnome
    units.system.wm.weston

    units.system.login.ly
    units.system.wm.niri
    ./hardware-configuration.nix
    units.system.vmware.shared
    units.system.oci.podman

    units.system.nix.nh

    units.themes.catpuccin
  ];

  time.timeZone = "Asia/Manila";
  networking.hostName = HOSTNAME;
  environment.sessionVariables.FLAKE_HOSTNAME = HOSTNAME;

  virtualisation.vmware.guest.enable = true;

  # Export certain ports used by dev environments to local subnet.
  # TODO: Investigate necessity. Since I do not have any port forwarded, do I really need this? Or can I just disable the firewall or explicitly allow via allowed{TCP/UDP}Ports?
  # TODO: Investigate if I need to migrate to nftables.
  networking.firewall = {
    enable = true; # By default, all ports are blocked.
    extraCommands =
      let
        localSubnet = "192.168.18.0/24";
        ports = [
          3000
          5173
        ];
      in
      pkgs.lib.concatMapStrings (port: ''
        iptables -A INPUT -p tcp -s ${localSubnet} --dport ${builtins.toString port} -j ACCEPT

      '') ports;
  };

  services.openssh.enable = true;
  services.openssh.settings = {
    PermitRootLogin = "prohibit-password";
  };

  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    useDefaultShell = true;
    openssh.authorizedKeys.keys = [
      # WSL host for clipboard syncing
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICc3ZSMJCScdRBrjB/4fnLyExAywVVUKjtRGVi9ozsIA mmfallacy@MMFALLACY"
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = import ./home;
  home-manager.extraSpecialArgs = with mmfallacy; {
    inherit const extras units;
    baseConfig = profile;
  };

  stylix.enable = true;

  system.stateVersion = "25.05";
}
