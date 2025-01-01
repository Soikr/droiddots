{pkgs, ...}: {
  imports = [
    ./modules
  ];

  environment = {
    packages = with pkgs; [
      neovim # Meowvim
      openssh
      busybox
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    motd = "Welcome to Nix-on-Droid!";

    etcBackupExtension = ".bak";
  };

  android-integration = {
    am.enable = true;
    termux-open.enable = true;
    termux-open-url.enable = true;
    xdg-open.enable = true;
    termux-setup-storage.enable = true;
  };

  user.shell = "${pkgs.zsh}/bin/zsh";

  nix = {
    package = pkgs.nixVersions.git;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  time.timeZone = "America/Los_Angeles";

  system.stateVersion = "24.05";
}
