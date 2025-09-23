{
  # Removes specified file from staging
  unstage = "reset HEAD --";

  # Push main branch to remote origin
  pom = "push origin main";
  # Push current branch to remote origin (same branch name)
  poh = "push origin HEAD";
  # same as `poh` but force push when with lease (i.e. latest commit is same as local copy)
  pohfl = "push origin HEAD --force-with-lease";

  # Push specified branch to remote origin
  po = "push origin";
  # Get current branch name
  cbr = "rev-parse --abbrev-ref HEAD";
  # Pull current branch from remote origin
  ppo = "!git pull origin $(git cbr)";

  # Inspect last commit in git log
  last = "log -1 HEAD --stat";

  # Commit staged files with the specified message
  cm = "commit -m";
  # Amend (Change message and add new staged files) topmost commit
  cma = "commit --amend";
  # Amend (Add new staged files) topmost commit without editing message
  cmane = "commit --amend --no-edit";

  # Output git status more cleanly (changed, staged)
  st = "! git status -sb && git lig";
  # Output git branches more cleanly with additional information
  br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
  # Output git aliases as a list
  alias = "! git config --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ /";
  # Outputs git log in oneline
  lo = "log --oneline";

  # Git diff
  df = "diff";
  dfc = "diff --cached";
  # Git diff using difftool
  dfv = "difftool -y";

  # Git switch
  sw = "switch";
  # Git switch, create
  swc = "switch -c";

  # Ignore current changes of specified file without untracking.
  igf = "update-index --skip-worktree";
  # Unignore current changes of specified file without untracking.
  uigf = "update-inde]x --no-skip-worktree";
  # Ignore all files that matches the specified pattern
  ig = "! git ls-files -z $1 | xargs -0 git igf";
  # Unignore all files that matches the specified pattern
  uig = "! git ls-files -z $1 | xargs -0 git uigf";
  # List all ignored and assume-unchanged files
  lig = "! echo -e \"\\033[34mIgnored and Assume-unchanged:\\033[0m\" && git ls-files -v | grep ^[Shc]";

}
