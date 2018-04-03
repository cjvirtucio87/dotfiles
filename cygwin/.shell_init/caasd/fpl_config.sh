# FPL Configuration
if [ -d $HOME/git/asias-asias-config ]; then
    . $HOME/git/asias-asias-config/bin/asiasEnv
fi
if [ -d $HOME/git/facility-facility-config ]; then
    . $HOME/git/facility-facility-config/bin/facilityEnv
fi
if [ -d $HOME/git/oversight-oversight-config ]; then
    . $HOME/git/oversight-oversight-config/bin/oversightEnv
fi
if [ -d $HOME/git/caasd-caasd-config ]; then
    . $HOME/git/caasd-caasd-config/bin/caasdEnv
fi
FPL_CONFIG_PROPS=$FPL_CONFIG_PROPS:$HOME/.developer/caasd-portal-automation/properties/credentials.pl:$HOME/.developer/caasd-portal-automation/properties/env.pl
