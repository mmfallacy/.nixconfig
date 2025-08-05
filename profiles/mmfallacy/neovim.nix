{
  units,
  extras,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    units.profiles.common.neovim
  ];

  programs.neovim.extraWrapperArgs = [
    # Do note that --set VAR VAL treats VAL as an explicit string, hence no runtime evaluation.
    "--run"
    ''export GEMINI_API_KEY="$(age --decrypt -i ~/.ssh/age.key ${extras.secrets.mmfallacy.GEMINI_API_KEY} | tr -d '\n')"''
  ];

  # Set vim alias for mmfallacy profile.
  programs.neovim.vimAlias = true;
}
