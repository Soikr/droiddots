{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      share = true;
      save = 500;
      size = 500;
    };

    shellAliases = {
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -al";

      mkdir = "mkdir -p";
      del = "rm -rf";

      # Overrides
      cat = "bat";

      # Programs
      g = "git";

      # Nix
      nb = "nix-on-droid switch --flake ~/.config/nix-on-droid";
      ne = "nvim ~/.config/nix-on-droid";
      nsh = "nix-shell";
      ns = "nix search nixpkgs";
      ngc = "nix-collect-garbage -d && nix-store --gc && nix-store --verify && nix store optimise";
    };

    initExtra = ''
      [ -f ~/.env/env.sh ] && source ~/.env/env.sh

      bindkey "\e[H" beginning-of-line
      bindkey "\e[F" end-of-line

      function cd() {
        builtin cd $*
        eza
      }

      function mkd() {
        mkdir $1
        builtin cd $1
      }

      function ls() {
        eza $*
      }

      function clone() { git clone git@$1.git }
      function gclone() { clone github.com:$1 }

      source "${pkgs.zsh-fzf-tab}/share/fzf-tab/lib/zsh-ls-colors/ls-colors.zsh"
      source "${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh"
      source "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh"
    '';
    prezto = {
      enable = true;
      caseSensitive = false;
      utility.safeOps = true;
      editor = {
        dotExpansion = true;
        keymap = "vi";
      };
      pmodules = ["autosuggestions" "directory" "editor" "git" "terminal"];
    };
  };
}
