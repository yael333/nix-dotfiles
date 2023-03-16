# modules/desktop/term/kitty.nix
#
# Nyaaa~

{ options, config, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.term.kitty;
in {
  options.modules.desktop.term.kitty = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {

    user.packages = with pkgs; [
      kitty
      (makeDesktopItem {
        name = "kitty";
        desktopName = "Kitty Terminal";
        genericName = "Default terminal";
        icon = "utilities-terminal";
        exec = "${kitty}/bin/kitty";
        categories = [ "Development" "System" "Utility" ];
      })
    ];
  };
}
