{ extras, ... }:
{

  home.sessionVariables = {
    # Add common secrets here!
  } // extras.secrets.mmfallacy;
}
