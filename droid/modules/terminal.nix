{pkgs, ...}: {
  terminal = {
    colors = {
      "foreground" = "#ebdbb2";
      "background" = "#141617";

      "color0" = "#1d2025";
      "color8" = "#504945";

      "color1" = "#c14a4a";
      "color9" = "#ea6962";

      "color2" = "#6c782e";
      "color10" = "#a9b665";

      "color3" = "#b47109";
      "color11" = "#d8a657";

      "color4" = "#45707a";
      "color12" = "#7daea3";

      "color5" = "#945e80";
      "color13" = "#d3869b";

      "color6" = "#6c782e";
      "color14" = "#89b482";

      "color7" = "#d4be98";
      "color15" = "#ddc7a1";
    };

    font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";
  };
}
