if status is-interactive
    # Commands to run in interactive sessions can go here
    complete --command config --wraps git
end

set -gx EDITOR nvim

set -gx KERL_BUILD_DOCS yes

abbr --add config 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

abbr --add www '/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe'

abbr --add g git
abbr --add gr 'git reset --hard'
abbr --add gs 'git status'
abbr --add gd 'git diff'
abbr --add gl 'git pull --prune'
abbr --add gp 'git push'
abbr --add cb 'git checkout'
abbr --add glog 'git log --oneline'
abbr --add gc 'git commit --patch'
abbr --add gca 'git commit --patch --amend'
abbr --add grm 'git checkout master && git pull --rebase && git checkout - && git pull --rebase && git rebase -'
abbr --add gmm 'git checkout master && git pull --rebase && git checkout - && git pull --rebase && git merge -'

abbr --add gpr 'gh pr create --assignee @me'

abbr --add d docker

abbr --add up 'docker-compose up -d'
abbr --add upn 'docker stop (docker ps --all --quiet) && docker rm (docker ps --all --quiet) && docker-compose up -d'

abbr --add k kubectl

abbr --add mf 'mix format'
abbr --add mc 'mix credo --strict'
abbr --add md 'mix dialyzer'
abbr --add mt 'mix test'
abbr --add mtf 'mix test --failed'
abbr --add m 'MIX_ENV=test mix coveralls.html --umbrella && open cover/excoveralls.html'

abbr --add t tmux_new
abbr --add tl 'tmux ls'
abbr --add tm tmux
abbr --add ta 'tmux attach'

abbr --add n nmtui

abbr --add my-branchs "git for-each-ref --format='%(refname:short) %(authorname)' refs/heads | grep (git config user.name) | cut -d' ' -f1"
~/bin/rtx activate fish | source
