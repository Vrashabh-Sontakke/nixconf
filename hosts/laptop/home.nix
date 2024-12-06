{
  inputs,
  outputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [outputs.homeManagerModules.default];

  programs.git.userName = "vrash";
  programs.git.userEmail = "vrash@sontakke.in";

  myHomeManager.impermanence.data.directories = [
    "nixconf"

    "Videos"
    "Documents"
    "Projects"
  ];

  myHomeManager.impermanence.cache.directories = [
    ".local/share/PrismLauncher"
    ".config/openvr"
    ".config/tidal-hifi"

    "Android"
    ".local/share/godot"
    ".config/alvr"
  ];

  programs.foot.enable = true;
  programs.wezterm.enable = true;

  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktop-full.enable = true;

    # bundles.gaming.enable = true;

    pipewire.enable = true;
    tenacity.enable = true;

    monitors = {
      "eDP-2" = {
        width = 1920;
        height = 1080;
        refreshRate = 120.;
        # x = 1920;
        # y = 0;
        # x = 0;
        # y = 0;
      };
    };

    # workspaces = {
    #   "2" = {
    #     monitorId = 0;
    #     autostart = with pkgs; [
    #      (lib.getExe firefox)
    #     ];
    #   };
    #   "10" = {
    #     monitorId = 1;
    #     autostart =  with pkgs; [
    #       (lib.getExe telegram-desktop)
    #       (lib.getExe vesktop)
    #     ];
    #   };
    # };

    keybinds = {
      "SUPER, Z".package = inputs.woomer.packages.${pkgs.system}.default;
    };

  };

  home = {
    username = "vrash";
    homeDirectory = lib.mkDefault "/home/vrash";
    stateVersion = "24.11";

    packages = with pkgs; [
      # obs-studio
      wf-recorder
      tidal-hifi
      gnome-sound-recorder
    ];
  };

}
