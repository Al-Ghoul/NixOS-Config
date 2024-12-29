{ lib, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "[░▒▓](#27352d)"
        "[ ❄️](bg:#638083 fg:#04494e)"
        "[](bg:#638083 fg:#637e83)"
        "$directory"
        "[](fg:#638083 bg:#374749)"
        "$git_branch"
        "$git_status"
        "[](fg:#374749 bg:#2c3a39)"
        "[](fg:#2c3a39 bg:#21272c)"
        "[ ](fg:#21272c)"
        ''

          $character''
      ];

      directory = {
        style = "fg:#e3e5e5 bg:#638083";
        format = lib.concatStrings [ "[ $path ]" "($style)" ];
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
        style = "bg:#394260";
        format = lib.concatStrings [
          "[[ $symbol $branch ](fg:#000000 bg:#374749)]"
          "($style)"
        ];
      };

      git_status = {
        style = "bg:#394260";
        format = lib.concatStrings [
          "[[($all_status$ahead_behind )](fg:#FFFFFF bg:#374749)]"
          "($style)"
        ];
      };

    };
  };
}
