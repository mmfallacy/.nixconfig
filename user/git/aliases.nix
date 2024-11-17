{
  unstage = "reset HEAD --";
  lo = "log --oneline";
  pom = "push origin main";
  poh = "push origin HEAD";
  po = "push origin";
  last = "log -1 HEAD --stat";
  cm = "commit -m";
  st = "status -sb";
  cma = "commit --amend";
      cmane = "commit --amend --no-edit";
  df = "diff";
  dfv = "difftool -y";
  br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
  alias = "! git config --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ /";
      sw = "switch";
      swc = "switch -c";
      igf = "update-index --skip-worktree";
  uigf = "update-index --no-skip-worktree";
  ig = "! git ls-files -z $1 | xargs -0 git igf";
  uig = "! git ls-files -z $1 | xargs -0 git uigf";
  lig = "! git ls-files -v | grep ^S";
  cbr = "rev-parse --abbrev-ref HEAD";
  ppo = "!git pull origin $(git cbr)";
  tm = "merge --no-commit --no-ff";
}
