# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'

# Mine
function gclean {
  git remote prune origin
  if git rev-parse --verify --quiet main; then
    git branch --merged main | grep -v "\* main" | xargs -n 1 git branch -d
  elif git rev-parse --verify --quiet master; then
    git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d
  fi
}

# git add everything and commit it with 'wip' msg
function gwip {
  git add .
  git commit -m 'wip'
}

# git add, git commit -m '.', git rebase NUM_COMMITS
function garc {
  git add .
  git commit -m '.'
  git rebase -i HEAD~"$1"
}

# git rebase NUM_COMMITS
function gr {
  git rebase -i HEAD~"$1"
}

function gitzip() { 
	git archive -o $@.zip HEAD
}
