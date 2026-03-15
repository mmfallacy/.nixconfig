{
  flake.hjemModules.zsh =
    {
      lib,
      ...
    }:
    {
      files.".zshrc".text = # bash
        ''
          # Source aliases
          source "$HOME/.zsh/.zshaliases"
        '';

      files.".zsh/.zshaliases".text = # bash
        ''
          alias ..="cd .."
          alias ...="cd ../.."
          alias ....="cd ../../.."

          alias cl="clear"

          alias dirs="dirs -v"
          alias mv="mv -i"
          alias rm="rm -Iv"
          mkcd() { mkdir -p "$1" && cd "$1"; }

          # Show sizes of immediate dirs
          alias dud="du -d 1 -h"

          # Show IPs
          myip() {
            echo "public: $(curl -s ifconfig.me)"
            echo "other:"
            hostname -I
          }

          # Create parent dirs if nonexisting
          alias mkdir="mkdir -p"
          alias path='echo $PATH | tr ":" "\n"'

          alias psg='ps aux | grep -i'

        '';
    };
}
