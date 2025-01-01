{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/git";
        user = "git";
      };
      "Avalanche" = {
        hostname = "100.73.27.7";
        user = "Czar";
        identityFile = "~/.ssh/localnetwork";
      };
    };
  };
}
