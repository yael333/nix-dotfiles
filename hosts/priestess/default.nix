{ pkgs, config, lib, ... }:
{
  imports = [
    ../home.nix
    ./hardware-configuration.nix
  ];

  ## Modules
  modules = {
    desktop = {
      bspwm.enable = true;
      apps = {
        rofi.enable = true;
      };
      browsers = {
        default = "firefox";
        firefox.enable = true;
      };
      gaming = {
        steam.enable = true;
        emulators.enable = true;
        emulators.psx.enable = true;
      };
      media = {
        documents.enable = true;
        graphics.enable = true;
        mpv.enable = true;
        ncmpcpp.enable = true;
      };
      term = {
        default = "xst";
        st.enable = true;
      };
      vm = {
        #qemu.enable = true;
      };
    };
    dev = {
      rust.enable = true;
      python.enable = true;
      cc.enable = true;    
};
    editors = {
      default = "emacs";
      emacs.enable = true;
      emacs.doom.enable = true;
      vim.enable = true;
    };
    shell = {
      #vaultwarden.enable = true;
      #direnv.enable = true;
      git.enable    = true;
      gnupg.enable  = true;
      tmux.enable   = true;
      zsh.enable    = true;
    };
    services = {
      #ssh.enable = true;
      #docker.enable = true;
    };
    theme.active = "alucard";
  };


  ## Local config
  #programs.ssh.startAgent = true;
  #services.openssh.startWhenNeeded = true;

  networking.networkmanager.enable = true;

  environment.variables = {
  	USER = "yael";
  };
}
