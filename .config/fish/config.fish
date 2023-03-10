if status is-interactive
    # Commands to run in interactive sessions can go here
    complete --command config --wraps git
end

set -gx EDITOR nvim

set -gx KERL_BUILD_DOCS yes

switch (uname -a)
    case '*MANJARO*'
        source /opt/asdf-vm/asdf.fish
    case '*archlinux*'
        source /opt/asdf-vm/asdf.fish
    case '*Linux*'
        source ~/.asdf/asdf.fish
    case 'Darwin*'
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

. ~/.asdf/plugins/dotnet-core/set-dotnet-home.fish

abbr --add --universal config 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

abbr --add --universal www '/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe'

abbr --add --universal g git
abbr --add --universal gr 'git reset --hard'
abbr --add --universal gs 'git status'
abbr --add --universal gd 'git diff'
abbr --add --universal gl 'git pull'
abbr --add --universal gp 'git push'
abbr --add --universal cb 'git checkout'
abbr --add --universal glog 'git log --oneline'
abbr --add --universal gc 'git commit --patch'
abbr --add --universal gca 'git commit --patch --amend'
abbr --add --universal grm 'git checkout master && git pull --rebase && git checkout - && git pull --rebase && git rebase -'
abbr --add --universal gmm 'git checkout master && git pull --rebase && git checkout - && git pull --rebase && git merge -'

abbr --add --universal gpr 'gh pr create'

abbr --add --universal rc 'docker stop (docker ps --all --quiet) && docker rm (docker ps --all --quiet)'
abbr --add --universal up 'docker-compose up -d'
abbr --add --universal upn 'docker stop (docker ps --all --quiet) && docker rm (docker ps --all --quiet) && docker-compose up -d'

abbr --add --universal k kubectl

abbr --add --universal mf 'mix format'
abbr --add --universal mc 'mix credo --strict'
abbr --add --universal md 'mix dialyzer'
abbr --add --universal mt 'mix test'
abbr --add --universal mtf 'mix test --failed'
abbr --add --universal m 'mix coveralls.html --umbrella && open cover/excoveralls.html'

abbr --add --universal t tmux_new
abbr --add --universal tl 'tmux ls'
abbr --add --universal tm tmux

abbr --add --universal n nmtui

abbr --add --universal my-branchs "git for-each-ref --format='%(refname:short) %(authorname)' refs/heads | grep (git config user.name) | cut -d' ' -f1"
