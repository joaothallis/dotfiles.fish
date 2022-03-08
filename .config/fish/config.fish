if status is-interactive
    # Commands to run in interactive sessions can go here
    complete --command config --wraps git
end

set -gx EDITOR nvim

switch (uname)
case Linux
    source /opt/asdf-vm/asdf.fish
end
