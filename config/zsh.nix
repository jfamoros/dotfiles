#
# Shell
#

{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;             # Auto suggest options and highlights syntact, searches in history for options
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    dirHashes = {
      docs    = "$HOME/Documents";
      vids    = "$HOME/Videos";
      imgs    = "$HOME/Images";
      games   = "$HOME/Games";
      dl      = "$HOME/Downloads";
      music   = "$HOME/Music";
    };
    
    shellAliases = {
      l = "ls -al --color=auto";
      ".." = "cd .. && pwd";
      "..." = "cd ../.. && pwd";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      shlvl = {
        disabled = false;
        style = "bright-red bold";
        symbol = " ";
      };
      username = {
        show_always = true;
        style_root = "bright-red bold";
        format = "[$user ]($style)\@ ";
      };
      hostname = {
        format = "[$hostname ]($style)";
        ssh_only = false;
      };

      golang.symbol = " ";
      docker_context.symbol = " ";
      directory.read_only = " ";
      aws.symbol = "  ";
      git_branch.symbol = " ";
      java.symbol = " ";
      memory_usage.symbol = " ";
      nix_shell.symbol = " ";
      package.symbol = " ";
      python.symbol = " ";
      rust.symbol = " ";
      gcloud.symbol = " ";
      terraform.symbol = "行";
      lua.symbol = " ";
    };
  };
}
