{
  imports = [
    ../common.nix
    ./configuration.nix
    ./runtime.nix
  ];

  # Placeholder NixOS guest; not registered with the host yet.
  # TODO: Choose its hostname, stateVersion, and actual service responsibilities.
  # Import the microvm.nix guest module when wiring up this guest.
}
