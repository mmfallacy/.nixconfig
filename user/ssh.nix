{ ... }:
{
  # Enable ssh-agent as a service;
  services.ssh-agent.enable = true;
  # Handle ssh by home-manager;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
}
