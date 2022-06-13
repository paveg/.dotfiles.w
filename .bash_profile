export XDG_CONFIG_HOME=~/.config

ssh-add $HOME/.ssh/id_github_rsa >& /dev/null

# Run fish-shell
exec fish
. "$HOME/.cargo/env"
