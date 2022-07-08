abbr --add --universal config 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

abbr --add --universal g git
abbr --add --universal gr 'git reset --hard'
abbr --add --universal gs 'git status'
abbr --add --universal gd 'git diff'
abbr --add --universal gl 'git pull'
abbr --add --universal gp 'git push'
abbr --add --universal glog 'git log --oneline'
abbr --add --universal gc 'git commit --patch'
abbr --add --universal gca 'git commit --patch --amend'
abbr --add --universal grm 'git checkout master && git pull --rebase && git checkout - && git pull --rebase && git rebase -'
abbr --add --universal gmm 'git checkout master && git pull --rebase && git checkout - && git pull --rebase && git merge -'

abbr --add --universal gpr 'gh pr create'

abbr --add --universal rc 'docker stop (docker ps --all --quiet) && docker rm (docker ps --all --quiet)'
abbr --add --universal rca 'docker stop (docker ps --all --quiet) && docker rm (docker ps --all --quiet) && docker-compose up -d'

abbr --add --universal k kubectl

abbr --add --universal mf 'mix format'
abbr --add --universal mc 'mix credo --strict'
abbr --add --universal md 'mix dialyzer'
abbr --add --universal mt 'mix test'
abbr --add --universal mtf 'mix test --failed'
abbr --add --universal m 'mix coveralls.html --umbrella && open cover/excoveralls.html'

abbr --add --universal t tmux_new
abbr --add --universal tl 'tmux ls'
