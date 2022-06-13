starship init fish | source

if status --is-interactive
  eval ($HOME/.linuxbrew/bin/brew shellenv)
end

set -U fish_user_paths /usr/local/bin $fish_user_paths
set -gx fish_user_paths "$HOME/linuxbrew/.linuxbrew/bin" $fish_user_paths
set -lx FZF_DEFAULT_OPTS "--reverse --border"
set -x PATH $HOME/.cargo/bin $PATH
set -x GOPATH $HOME
set -x EDITOR nvim
source $HOME/.asdf/asdf.fish

eval (direnv hook fish)

if [ -z "$SSH_AUTH_SOCK" ]
    set RUNNING_AGENT (ps -ax | grep 'ssh-agent -c' | grep -v grep | wc -l | tr -d '[:space:]')
    if [ "$RUNNING_AGENT" = "0" ]
        ssh-agent -c &> $HOME/.ssh/ssh-agent-fish
        cat $HOME/.ssh/ssh-agent-fish | sed 's/setenv \([^ ]*\) /export \1=/g' > $HOME/.ssh/ssh-agent
    end
    eval (cat $HOME/.ssh/ssh-agent-fish)
    ssh-add $HOME/.ssh/id_github_rsa
end

function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session
        return
    end

    set new_session "Create New Session"
    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX
    attach_tmux_session_if_needed
end

# alias
alias g='git'
alias vi='nvim'

function distinct -d "Returns a set of the distinct elements of coll."
    set -l uniq
    for a in $argv
        if not contains $a $uniq
            set uniq $uniq $a
            echo $a
        end
    end
end

distinct
