{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;

    extensions = [
      # Bitwarden
      {
        id = "nngceckbapebfimnlniiiahkandclblb";
      }
    ];
  };
}
