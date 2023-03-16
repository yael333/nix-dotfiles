{ config, lib, ... }:

with builtins;
with lib;
let blocklist = fetchurl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts;
in {
  networking.extraHosts = ''
    # 192.168.1.1   router.home

    # Hosts

    # Block garbage
    ${optionalString config.services.xserver.enable (readFile blocklist)}
  '';

  ## Location config -- since Israel is my 127.0.0.1
  time.timeZone = mkDefault "Asia/Jerusalem";
  i18n.defaultLocale = mkDefault "en_US.UTF-8";
  # For redshift, mainly
  location = (if config.time.timeZone == "Asia/Jerusalem" then {
    latitude = 31.7683;
    longitude = 35.2137;
  } else if config.time.timeZone == "Europe/Berlin" then {
    latitude = 52.3759;
    longitude = 9.7320;
  } else {});

  # So the vaultwarden CLI knows where to find my server.
  # modules.shell.vaultwarden.config.server = "vault.lissner.net";
}
