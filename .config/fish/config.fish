if status is-interactive
    # Commands to run in interactive sessions can go here
    complete --command config --wraps git
end

set -gx EDITOR nvim

switch (uname -a)
    case '*MANJARO*'
        source /opt/asdf-vm/asdf.fish
    case '*Linux*'
        source ~/.asdf/asdf.fish
    case 'Darwin*'
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
end
