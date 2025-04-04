{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Enable shell integration inside the respective shell's .nix file.
}
