#!/bin/sh

# ------------------------------------------------------------------------------
#
# Author: theprimeagen (this is a modified version)
#   original script: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
#   theprimeagen developer workflow: https://www.youtube.com/watch?v=bdumjiHabhQ&t=208s
#
# Date: Feb 10, 2023
#   Modified: Aug 07, 2023
#
# Description:
#   Simplify the creation of tmux sessions. Both, zsh and neovim, have mappings pointing to this script (Ctrl-f)
#   The original script doesn't automatically attach when creating the first session
#
# Required packages:
#   fd, fzf
#
# ------------------------------------------------------------------------------

# Add any directories you want (use `$HOME` instead of `~`)
directories="$HOME/ $HOME/projects/"

# Use the directory passed as argument or fuzzy find (if no argument is provided)
if [[ $# -eq 1 ]]; then
    working_directory=$1
else
    working_directory=$(fd --unrestricted --exact-depth=1 --type=directory . $directories | fzf)
fi

if [[ -z $working_directory ]]; then
    exit 0
fi

# Use the directory name as the session name (session names cannot include dots, replace them with `_`)
session_name=$(basename "$working_directory" | tr . _)

# Create the session (if necessary) in detached mode
if ! tmux has-session -t $session_name 2> /dev/null; then
    tmux new-session -s $session_name -c $working_directory -d
fi 

# Make tmux focus the given session
if [[ -n $TMUX ]]; then 
    tmux switch-client -t $session_name
else
    tmux attach-session -t $session_name
fi

