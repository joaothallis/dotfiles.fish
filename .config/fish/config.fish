if status is-interactive
    # Commands to run in interactive sessions can go here
    complete --command config --wraps git
end

set -gx EDITOR nvim

switch (cat /etc/os-release | head -n 1)
    case '*Ubuntu*'
        source ~/.asdf/asdf.fish
    case '*'
        source /opt/asdf-vm/asdf.fish
end
