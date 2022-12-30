# variables
UD=/workspace/ubuntu-dev

# update env variable CODEBASE
create_env() {
  if [ ! -f "$UD/dotfile/.env" ]; then
    sed "s/\$HOME\/codebase/\/workspace/" \
      "$UD"/dotfile/.env-template > "$UD"/dotfile/.env
  fi
}

if [ -d "$UD" ]; then
  create_env

  cd $UD/script
  ./dotfile.sh clean
  source ./dotfile.sh install
fi

# Source user specific environment
source $GITPOD_REPO_ROOT/dotfile/.bash_aliases

cd $OLDPWD
