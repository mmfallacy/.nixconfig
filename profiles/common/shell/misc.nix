{ extras, pkgs, ... }:
{
  home.packages = with pkgs; [
    tldr
    eza
  ];

  home.sessionVariables = {
    # Temporary fix for rebuilds not updating environment variables
    # kachick:dotfiles/794fbf3
    __HM_SESS_VARS_SOURCED = "";
  };
}
