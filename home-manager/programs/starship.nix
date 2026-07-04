{ }: {
  enable = true;
  settings = {
    format = "$username$directory$git_branch$git_status$fill$lua$c$nodejs$rust$python$time\n [->](fg:green) ";
    directory = {
      format = "[ $path ]($style)";
      style = "fg:blue bold";
      truncation_length = 3;
      truncation_symbol = "";
      home_symbol = "";
    };
    directory.substitutions = {
      Documents = "󰈙";
      Downloads = " ";
      Music = " ";
      Pictures = " ";
    };
    fill = {
      style = "fg:fg bold";
      symbol = " ";
    };
    git_branch = {
      format = "[•](fg:gray_3)[ $symbol $branch]($style) ";
      style = "fg:purple";
      symbol = "";
    };
    git_status = {
      style = "fg:orange bold";
      format = "([$all_status$ahead_behind]($style)) ";
      up_to_date = "[✓](fg:teal bold)";
      untracked = "[?\($count\)](fg:orange bold)";
      stashed = "[\$](fg:purple bold)";
      modified = "[!\($count\)](fg:teal bold)";
      renamed = "[»\($count\)](fg:yellow bold)";
      deleted = "[✘\($count\)](style bold)";
      staged = "[++\($count\)](fg:blue bold)";
      ahead = "[⇡\(${count}\)](fg:gray_1 bold)";
      diverged = "⇕[\[](fg:purple bold)[⇡\(${ahead_count}\)](fg:blue bold)[⇣\(${behind_count}\)](fg:yellow bold)[\]](fg:purple bold)";
      behind = "[⇣\(${count}\)](fg:orange bold)";
    };
    time = {
      format = " [$time -.<~ ★]($style)";
      style = "fg:teal bold";
      time_format = "%I:%M%P";
      use_12hr = true;
    };
    username = {
      format = "[󰄛 $user]($style) [•](fg:gray_3)";
      show_always = true;
      style_root = "fg:red bold";
      style_user = "fg:pink bold";
    };
    c = {
      style = "fg:blue bold";
      format = " [$symbol$version]($style) [•](fg:gray_3)";
      symbol = " ";
    };
    lua = {
      style = "fg:blue bold";
      format = " [$symbol$version]($style) [•](fg:gray_3)";
      symbol = " ";
    };
    nodejs = {
      style = "fg:green bold";
      format = " [$symbol$version]($style) [•](fg:gray_3)";
      symbol = "󰎙 ";
    };
    rust = {
      style = "fg:orange bold";
      format = " [$symbol$version]($style) [•](fg:gray_3)";
      symbol = " ";
    };
    python = {
      style = "fg:blue bold";
      format = " [$symbol$version]($style) [•](fg:gray_3)";
      symbol = " ";
    };
  };
}
