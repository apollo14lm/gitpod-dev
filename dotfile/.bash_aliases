# source files
alias sba="source ~/.bash_aliases"
alias sbp="source ~/.bash_profile"

alias cdgd="cd /workspace/gitpod-dev"
alias cdud="cd /workspace/ubuntu-dev"

alias db-gitpod="docker build -f .gitpod.Dockerfile --tag gitpod-dev ."
alias dr-gitpod="docker run -it --rm gitpod-dev /bin/bash"

alias gitp-gd='git push \
https://${GITHUB_ACCESS_TOKEN}@github.com/apollo14lm/gitpod-dev.git'
