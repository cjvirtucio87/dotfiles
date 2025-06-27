# Enable prompt substitutions
autoload -Uz colors && colors

# Set PS1 with colored username (green) and hostname (red)
export PS1='%F{green}%n%f@%F{red}%m%f %~ %# '
