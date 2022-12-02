# variables
UD=/workspace/ubuntu-dev

# update env variable CODEBASE
create_env() {
  if [ ! -f "$UD/dotfile/.env" ]; then
    sed "s/\$HOME\/codebase/\/workspace/" \
      "$UD"/dotfile/.env-template > "$UD"/dotfile/.env
  fi
}

# appending a env variable to a .env file only if it does not already exist
append_env() {
  param=$1
  #echo "${param}=${!param}"
  grep -qxF "${param}=${!param}" $UD/dotfile/.env \
    || echo "${param}=${!param}" >> $UD/dotfile/.env
}

# add directory to $PATH if it's not already
append_path() {
  echo "$1"
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
    echo "1"
  fi
  echo $PATH
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
