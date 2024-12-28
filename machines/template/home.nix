inputs @ { lib , pkgs , baseConfig , ... }: {
  # Import base config
  imports = [
    baseConfig
  ];

  # Specify overrides here.
  # User modules should be written with the ability to override in mind (i.e. mkDefault for overridable values.)
  # In case you need to override an option that isn't overridable, create a new module.
}
