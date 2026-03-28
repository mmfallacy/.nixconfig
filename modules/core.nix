{
  flake.nixosModules.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.system.core.enable = lib.mkEnableOption "system.core";

      config = lib.mkIf config.custom.system.core.enable {
        imports = with config.flake.nixosModules; [
          zsh
        ];
        # Clear default packages not necessary for running Nix
        # environment.defaultPackages ships with packages by default hence the need to override them.
        environment.defaultPackages = [ ];

        # Networking
        networking.hostName = lib.mkDefault "nixos";
        networking.networkmanager.enable = true;

        # System packages
        environment.systemPackages = with pkgs; [
          git
        ];

        # Set Environment Variable
        environment.sessionVariables = {
          IS_NIXOS = 1;
        };

        security.sudo.extraConfig = ''
          Defaults pwfeedback
          Defaults timestamp_timeout=30 # mins
        '';
      };
    };
}
