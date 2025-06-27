{ extras, ... }:
{

  home.sessionVariables = {
    # Temporary fix for rebuilds not updating environment variables
    # kachick:dotfiles/794fbf3
    __HM_SESS_VARS_SOURCED = "";

    # Add common secrets here!
  } // extras.secrets.mmfallacy;
}
