source ~/.node_conf.sh
source ~/.usr_bin_conf.sh
source ~/.golang_conf.sh
source ~/.ruby_conf.sh
source ~/.git_conf.sh
source ~/.viking_conf.sh
source ~/.libcode_conf.sh
source ~/.mov_converter_conf.sh
source ~/.java_conf.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
