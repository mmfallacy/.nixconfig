{config, pkgs, lib, ...}:

{
  users.users.mmfallacy = {
    isNormalUser = true;
    description = "Michael M.";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    	#  thunderbird
    ];
  };

  networking.hostName = "mmfallacy";
}
