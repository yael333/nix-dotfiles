# modules/dev/cc.nix --- C & C++
#
# I love C, C++ less much...  Some essential tools to create software with the second greatest language to ever be created.

{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let devCfg = config.modules.dev;
    cfg = devCfg.cc;
in {
  options.modules.dev.cc = {
    enable = mkBoolOpt false;
    xdg.enable = mkBoolOpt devCfg.xdg.enable;
  };

  config = mkMerge [
    (mkIf cfg.enable {
      user.packages = with pkgs; [
        clang
        gcc
        bear
        gdb
        cmake
        llvmPackages.libcxx
      ];
    })

    (mkIf cfg.xdg.enable {
      # TODO
    })
  ];
}
