{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.multi-user-git;
in
{

  programs.git = {
    # Disable autowire const.username and email
    # These information will be wired per repo
    # userName = lib.mkForce null;
    # userEmail = lib.mkForce null;
    # signing.key = lib.mkForce null;

    # Force global signingFormat
    extraConfig.gpg.format = lib.mkForce cfg.signingFormat;

    # Disable guessing for default user.email and user.name;
    extraConfig.user.useConfigOnly = true;
  };

  home.packages =
    let
      gitas = pkgs.writers.writePython3Bin "gitas" { doCheck = false; } ''
        import json, sys

        users = json.loads("""${builtins.toJSON cfg.users}""")

        RESET = "\033[0m"
        BOLD      = "\033[1m"
        DIM       = "\033[2m"
        ITALIC    = "\033[3m"
        UNDERLINE = "\033[4m"
        RED     = "\033[31m"
        GREEN   = "\033[32m"
        YELLOW  = "\033[33m"
        BLUE    = "\033[34m"
        CYAN    = "\033[36m"

        # Build pretty string using ANSI
        def c(string,pre,suf=RESET):
          _pre=""
          if type(pre) is str:
            _pre = pre
          elif type(pre) is list:
            _pre = "".join(pre)
          return f"{_pre}{string}{suf}"

        def log(msg, ctx="gitas"):
          return print(c(f"{ctx}: {msg}",RED))

        # Panic if condition not met
        def panic(cond, msg, ctx="gitas"):
          if not cond: return
          print(c(f"${ctx}: {msg}",RED))
          exit(1)

        def print_help():
          print(c("Usage:",[BOLD,YELLOW]),c("gitas <user|number>",YELLOW))
          print("Sets local .gitconfig credentials based on specified user")
          print()
          print(c("Usage:",[BOLD,YELLOW]),c("gitas <user|number> clone <github url>",YELLOW))
          print("Clones given repo using authKey of specified user")
          print()

          print(c("Registered Users:", [BOLD,CYAN]))
          for i, user in enumerate(users):
            print("\t", i, user['username'])

        # Given key, return user dict from users
        def get_user(key):
          user = None
          if key.isdigit():
            panic(len(users) > int(key), "Given index goes out of bounds")
            user = users[int(key)]
          else:
            matches = list(filter(lambda u: u["username"] == key, users))
            panic(len(matches) == 1,f"Multiple matches for given username! {len(matches)} matches.")
            user = matches[0]

          return user

        def switch(user):
          print(user)

        def clone(user, repo):
          print(user, repo)

        def main():
          args = sys.argv[1:];

          if not args: return print_help()

          if len(args) == 1:
            user = get_user(args[0])
            log(f"Switching to user {user["username"]}")
            return switch(user)
           
          elif args[1] == "clone" or args[1] == "c":
            user = get_user(args[0])
            panic(len(args) == 3, "Missing repository url")
            repo = args[2]
            log(f"Cloning repository {repo} as user {user["username"]}")
            return clone(user, repo)

          else:
            return panic(False, "Incorrect usage. Run gitas without arguments for the help file.")

        if __name__=="__main__":
          main()
      '';
    in
    [
      gitas
    ];
}
