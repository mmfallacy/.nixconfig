{
  flake.nixosMachineModules.vesperon =
    { lib, ... }:
    {
      custom.quickenable.system.modules = [
        "core"
        "nix"
        "grub"
        "noctalia"
        "niri"
        "locale-en-PH"
        "weston"
        "nh"
        "ly"
      ];

      environment.systemPackages = [
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";

      virtualisation.vmware.guest.enable = true;
      custom.system.vmware-shared.enable = true;

      networking.firewall = {
        enable = true; # By default, all ports are blocked.
        extraCommands =
          let
            localSubnet = "192.168.18.0/24";
            ports = [
              "3000:9000"
            ];
          in
          lib.concatMapStrings (port: ''
            iptables -A INPUT -p tcp -s ${localSubnet} --dport ${builtins.toString port} -j ACCEPT

          '') ports;
      };
    };
}
