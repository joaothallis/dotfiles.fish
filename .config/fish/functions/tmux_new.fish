function tmux_new
    set session (basename (pwd))
    if test -n "$TMUX"
        tmux new -s $session -d
        set session (string replace -a . _ $session)
        tmux switch-client -t $session
    else
        tmux new -t $session
    end
end
