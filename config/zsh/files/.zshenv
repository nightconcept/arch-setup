# Zsh will look for the following configuration files (in order) in the user's $HOME directory (defined in `/etc/passwd` for each user) or in `/etc/zsh/` for all users.
#
#   - .zshenv - Should only contain user’s environment variables.
#   - .zprofile - Can be used to execute commands just after logging in.
#   - .zshrc - Should be used for the shell configuration and for executing commands.
#   - .zlogin - Same purpose than .zprofile, but read just after .zshrc.
#   - .zlogout - Can be used to execute commands when a shell exit.
#
# Every time we open a terminal, zsh will find this file in the home directory, the `$ZDOTDIR` (https://wiki.archlinux.org/title/XDG_Base_Directory) variable will instruct zsh about where to look for the config files.

# See a graphical representation here: https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html#implementation

# No need to export since this variable is only needed to start zsh.

ZDOTDIR="$HOME/.config/zsh"
. "$HOME/.cargo/env"
