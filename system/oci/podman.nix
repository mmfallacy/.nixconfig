{ pkgs, ... }:
{
  # https://nixos.wiki/wiki/Podman
  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;

    defaultNetwork.settings.dns_enabled = true;
  };

  environment.systemPackages = with pkgs; [
    # Add more development tools here!
    podman-compose
  ];

}
