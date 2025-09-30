#! /nix/store/vxl8pzgkkw8vdb4agzwm58imrfclmfrx-python3-3.12.11/bin/python3.12
import json, sys, subprocess, os

users = []

## Handle Nix Injection
if "@@development@@" == "@@"+"development"+"@@":
  users = json.loads("""[{"authKey":"~/.ssh/id_ed25519","email":"31348500+mmfallacy@users.noreply.github.com","signingKey":"~/.ssh/id_ed25519","username":"mmfallacy"},{"authKey":"~/.ssh/mmfallacy-extra_ed25519","email":"205347616+mmfallacy-extra@users.noreply.github.com","signingKey":"~/.ssh/mmfallacy-extra_ed25519","username":"mmfallacy-extra"},{"authKey":"~/.ssh/ryuuudev_ed25519","email":"211357809+ryuuudev@users.noreply.github.com","signingKey":"~/.ssh/ryuuudev_ed25519","username":"ryuuudev"}]""")
else:
  users = json.loads("""@@USERS@@""")

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

def get_ssh_command(identityFile):
  path = os.path.expanduser(identityFile)
  panic(os.path.isfile(path), "Cannot find provided identity file")
  return f"ssh -i {identityFile} -o IdentitiesOnly=yes"

def git(*args,env=None):
  try:
    env = {**os.environ, **(env or {})}
    ret = subprocess.run(["git", *args], check=True, env=env)
    return (True, ret.returncode)
  except Exception as err:
    return (False, err)

# Build pretty string using ANSI
def c(string,pre,suf=RESET):
  _pre=""
  if type(pre) is str:
    _pre = pre
  elif type(pre) is list:
    _pre = "".join(pre)
  return f"{_pre}{string}{suf}"

def log(msg, level="INFO",ctx="gitas"):
  color = "";
  match level:
    case "WARN":
      color = YELLOW
    case "ERROR":
      color = RED
    case "SUCCESS":
      color = GREEN
    case "INFO" | _:
      color = CYAN
  return print(c(f"{ctx}: {msg}",color))

# Panic if condition not met
def panic(cond, msg, ctx="gitas"):
  if cond: return
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
  res = git("config", "--local", "user.name", user["username"])
  panic(res[0], "set local config failed!", ctx="git")
  res = git("config", "--local", "user.email", user["email"])
  panic(res[0], "set local config failed!", ctx="git")
  res = git("config", "--local", "user.signingKey", user["signingKey"])
  panic(res[0], "set local config failed!", ctx="git")
  res = git("config", "--local", "core.sshCommand", get_ssh_command(user["authKey"]))
  panic(res[0], "set local config failed!", ctx="git")
  log(f"Successfully switched repo credentials to ${user["username"]}", level="SUCCESS")

  return 0

def clone(user, repo, *extra_args):
  res = git("clone", repo, *extra_args or "", env={"GIT_SSH_COMMAND":get_ssh_command(user["authKey"])})
  panic(res[0], "clone failed!", ctx="git")
  log(f"Successfully cloned ${repo} repo!", level="SUCCESS")
  log(f"Please manually run `gitas {user["username"]}` within the cloned repo to update the local .gitconfig", level="WARN")

  return 0
  

def main():
  args = sys.argv[1:];

  if not args: return print_help()

  if len(args) == 1:
    user = get_user(args[0])
    log(f"Switching to user {user["username"]}")
    return switch(user)
   
  elif args[1] == "clone" or args[1] == "c":
    user = get_user(args[0])
    panic(len(args) >= 3, "Missing repository url")
    repo = args[2]
    log(f"Cloning repository {repo} as user {user["username"]}")
    return clone(user, repo, *args[3:])

  else:
    return panic(False, "Incorrect usage. Run gitas without arguments for the help file.")

if __name__=="__main__":
  exit(main())
