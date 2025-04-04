{ ... }:
{
  # Enable ssh-agent as a service;
  services.ssh-agent.enable = true;
  # Handle ssh by home-manager;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "mmfallacy-extra.github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/mmfallacy-extra_ed25519";
      };
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  # Setup ssh-keys
}
