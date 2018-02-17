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

source $HOME/.shell_init/caasd/index.sh
source $HOME/.shell_init/git_config/index.sh
source $HOME/.shell_init/go_config/index.sh

# Exports

export CAASD_AUTOMATION_DIR PERL5LIB http_proxy https_proxy no_proxy HTTPS_CA_FILE FPL_CONFIG_PROPS

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

#source ~/.bashrc
