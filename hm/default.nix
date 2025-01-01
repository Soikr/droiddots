{...}: {
  imports = [
    ./modules
  ];

  programs = {
    bat.enable = true;
    zoxide.enable = true;
    eza.enable = true;
    ripgrep.enable = true;
    yt-dlp.enable = true;
    fd.enable = true;
    tealdeer.enable = true;
    fastfetch.enable = true;
    gh.enable = true;
    gpg.enable = true;
  };

  services = {
    gpg-agent.enable = true;
  };

  home.stateVersion = "24.11";
}
