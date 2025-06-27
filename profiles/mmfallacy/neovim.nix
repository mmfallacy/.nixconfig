{ units, extras, ... }:
{
  imports = [
    units.profiles.common.neovim
  ];

  programs.neovim.extraWrapperArgs = [
    "--set"
    "AGE_GEMINI_API_KEY"
    "${extras.secrets.mmfallacy.GEMINI_API_KEY}"
  ];
}
