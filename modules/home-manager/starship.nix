{lib, ...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "[░▒▓](#35272a)"
        "[ ❄️](bg:#836463 fg:#4e0404)"
        "[](bg:#836463 fg:#836363)"
        "$directory"
        "[](fg:#836463 bg:#493837)"
        "$git_branch"
        "$git_status"
        "[](fg:#493837 bg:#3a2c2c)"
        "[](fg:#3a2c2c bg:#2c2121)"
        "[ ](fg:#2c2121)"
        ''

          $character''
      ];

      directory = {
        style = "fg:#e3e5e5 bg:#836463";
        format = lib.concatStrings ["[ $path ]" "($style)"];
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      directory.substitutions = {
        Documents = " ";
        Downloads = " ";
        Music = " ";
        Pictures = " ";
      };

      git_branch = {
        symbol = "";
        style = "bg:#603939";
        format = lib.concatStrings [
          "[[ $symbol $branch ](fg:#000000 bg:#493837)]"
          "($style)"
        ];
      };

      git_status = {
        style = "bg:#603939";
        format = lib.concatStrings [
          "[[($all_status$ahead_behind )](fg:#FFFFFF bg:#493837)]"
          "($style)"
        ];
      };
    };
  };
}
