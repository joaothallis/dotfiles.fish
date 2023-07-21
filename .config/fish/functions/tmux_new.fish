function tmux_new
    switch ($argv)
        case ''
            set session (basename (pwd))
        case '*'
            set session $argv
    end

    if test -n "$TMUX"
        tmux new -s $session -d
        set session (string replace -a . _ $session)
        tmux switch-client -t $session
    else
        tmux new -t $session
    end
end
