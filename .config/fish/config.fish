if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -e /Applications/Postgres.app/Contents/Versions/latest/bin/psql
    fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin/psql
end
if test -d ~/.cargo/bin
    fish_add_path ~/.cargo/bin
end
if test -d ~/go/bin
    fish_add_path ~/go/bin
end
if command -v bat > /dev/null
    abbr --add --global cat bat
end

#-------------------------------
# ENVIRONMENT VARIABLES
#-------------------------------
set EDITOR "nvim"
set --universal fish_color_command F8F8F2
set --export HOMEBREW_NO_ENV_HINTS true
set --export XDG_CONFIG_HOME $HOME/.config
# set --export DOCKER_DEFAULT_PLATFORM linux/arm64

# Fish defaults
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support no
set -g theme_use_abbreviated_branch_name no
set -g theme_display_vagrant no
set -g theme_display_docker_machine yes
set -g theme_display_aws_vault_profile yes
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_nix yes
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user no
set -g theme_display_sudo_user no
set -g theme_display_hostname no
set -g theme_display_vi no
set -g theme_display_date yes
set -g theme_display_cmd_duration yes
set -g theme_title_display_process no
set -g theme_title_display_path yes
set -g theme_title_display_user no
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %I:%M:%S"
set -g theme_date_timezone America/Chicago
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 0
set -g theme_newline_cursor no
set -g theme_newline_prompt '$'

#-------------------------------
# ABBREVIATIONS
#-------------------------------
abbr --add --global 'gs' 'git status --short'
abbr --add --global 'gd' 'git diff'
abbr --add --global 'gco' 'git checkout'
abbr --add --global 'stash' 'git stash push -m '
abbr --add --global 'gsl' 'git stash list'
abbr --add --global 'gsa' 'git stash apply'
abbr --add --global 'main' 'git checkout main'
abbr --add --global 'master' 'git checkout master'
abbr --add --global 'commit' 'git commit -m'
abbr --add --global 'clone' 'git clone'
abbr --add --global 'wip' 'git add --all && git commit -m 'WIP''
abbr --add --global 'add' 'git add --all'
abbr --add --global 'push' 'git push origin head'
abbr --add --global 'forcepush' 'git push -f origin head'
abbr --add --global 'rebase' 'git rebase'
abbr --add --global 'continue' 'git rebase --continue'
abbr --add --global 'gitb' 'git branch --show-current | pbcopy'
abbr --add --global 'pull' 'git pull'
abbr --add --global 'gt' 'gotest --cover ./...'
abbr --add --global 'gl' 'git branch --sort=-committerdate | head -n 20'
abbr --add --global 'gh' 'git log --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit --date=relative -n 40'
# abbr --add --global 'dps' 'docker ps'
abbr --add --global 'dps' 'docker ps $argv | awk -F \'[ ][ ]+\' \'{ print $1 "%" $2 "%" $7}\' | column -s "%" -t'
abbr --add --global 'dpsa' 'docker ps -a'
abbr --add --global 'cr' 'time cargo run src/main.rs'
abbr --add --global 'cb' 'time cargo build'
abbr --add --global 'dcu' 'docker compose up -d'
abbr --add --global 'dcub' 'docker compose up -d --build'
abbr --add --global 'unset' 'set --erase'
abbr --add --global 'n' 'nvim'
abbr --add --global 'f' 'open .'
abbr --add --global 'c' 'code .'
abbr --add --global 'reload' '. ~/.config/fish/config.fish'
abbr --add --global 'gci' 'golangci-lint run ./... --print-issued-lines=false --max-same-issues=0 --max-issues-per-linter=0'
abbr --add --global 'caffeinate' 'tmux new-session -d -s caffeinate \'caffeinate\''
abbr --add --global 'decaf' 'tmux kill-session -t caffeinate'
abbr --add --global 'tree' 'exa -aT -I ".git"'
abbr --add --global 'tls' 'tmux ls'
abbr --add --global 'd' 'docker'
abbr --add --global 'k' 'kubectl'
abbr --add --global 'current' 'kubectl config current-context '
abbr --add --global 'prod' 'kubectl config use-context prod'
abbr --add --global 'stage' 'kubectl config use-context stage'
abbr --add --global 'context' 'kubectl config use-context'
abbr --add --global 'kn' 'kubens'
abbr --add --global 'gb' 'go build -o /dev/null ./...'
abbr --add --global 'gbx' 'time go build -o /dev/null ./... && \
                     time golangci-lint run --new --timeout 2m ./... && \
                     golangci-lint run ./... --print-issued-lines=false --max-same-issues=0 --max-issues-per-linter=0 | wc -l'

#-------------------------------
# FUNCTIONS
#-------------------------------

#-------------------------------
# ALIASES
#-------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Changing "ls" to "exa"
if command -v exa > /dev/null
    alias ls='exa -la --no-permissions --group-directories-first'
    alias ll='exa -la --no-permissions --group-directories-first'
    alias lls='exa -la --no-permissions --group-directories-first --sort=size --header'
    alias lld='exa -la --no-permissions --group-directories-first --sort=date --header'
    alias lt='exa -laT --no-permissions --group-directories-first'
    alias l.='exa -a | egrep "^\."'
end

# Replacing grep with rg
if command -v rg > /dev/null
    abbr --add --global 'g' 'rg --fixed-strings --pretty'
end

# confirm before overwriting something
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -i'
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation


function namespace
    kubectl config set-context --current --namespace="$argv"
end

#-------------------------------
# STARSHIP PROMPT
#-------------------------------
if command -v starship > /dev/null
    starship init fish | source
end

#-------------------------------
# NAVI AS WIDGET(CTRL+G)
#-------------------------------
if command -v navi > /dev/null
    navi widget fish | source
end

# scrips that require bass
if type -q bass

# nvm requires bass to work
if test -e ~/.nvm/nvm.sh
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end
end

#-------------------------------
# NIX
#-------------------------------
if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    bass source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
end

#-------------------------------
# SECRETS
#-------------------------------
# secret file should be in .gitignore
if test -e ~/.config/fish/secret.fish
    source ~/.config/fish/secret.fish
end
end
