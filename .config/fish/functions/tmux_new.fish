function tmux_new
    if test -n "$TMUX"
        tmux new -s (basename (pwd)) -d
        tmux switch-client -t (basename (pwd))
    else
        tmux new -t (basename (pwd))
    end
end
