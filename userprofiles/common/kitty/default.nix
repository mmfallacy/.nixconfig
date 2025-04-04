{ ... }:
{
  # Handle thru home-manager.
  # This allows stylix to inject its theming capabilities to kitty.conf
  programs.kitty = {
    enable = true;
  };
}
