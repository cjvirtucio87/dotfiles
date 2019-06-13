# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi
  
# Source host specific bash_profile if it exists
if [ -f "${HOME}/.bash_profile_env" ] ; then
  source "${HOME}/.bash_profile_env"
fi

# Source host specific bashrc if it exists
if [ -f "${HOME}/.bashrc_env" ] ; then
  source "${HOME}/.bashrc_env"
fi
  
# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

# dotfiles
PATH=$HOME/.helpers/bin:$PATH

source $HOME/.shell_init/git_config/index.sh
source $HOME/.shell_init/python_config/index.sh
source $HOME/.shell_init/java_config/index.sh
