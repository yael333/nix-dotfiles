{ options, config, lib, ... }:

with lib;
with lib.my;
let cfg = config.modules.services.ssh;
in {
  options.modules.services.ssh = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      kbdInteractiveAuthentication = false;
      passwordAuthentication = false;
    };

    user.openssh.authorizedKeys.keys =
      if config.user.name == "yael"
      then [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPhN4Iq070J9rFJhOwP9RUyUJG9MC1W5KnDGqBqWZnlu yael" ]
      else [];
  };
}
