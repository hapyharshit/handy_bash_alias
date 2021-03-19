
#### simple repository with some very helpful commonly used commands as alias or a function
###usage
simply use command `source bashrc` 

## git commands
```shell
alias ga='git add'
alias gsu='git status -uno'
function gall() {
	git add $(gsu | awk '/modified:/ {print $2}')
}
alias gc='git checkout'
alias gcd='git checkout develop'
alias gcb='git checkout -b'
alias gs='git stash'
function gss() {
	git stash save "$1"
}
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gpl='git pull'
alias gma='git merge --abort'
function gm() {
        # "i" - accept incoming change
        # "c" - accept current change
        git merge $1 `if [[ $2 == "i" ]]; then echo "--strategy-option theirs"; fi` `if [[ $2 == "c" ]]; then echo "--strategy-option ours"; fi`;
}
alias gt='git tag'
alias gtd='git tag --delete'
alias gbc='git branch | grep "*"'
function gpo() {
	git push origin $(gbc | awk '{print $2}')
}
alias gb='git branch | grep'
alias gfo='git fetch origin'
alias gfc='git fetch && git checkout'
alias gcp='git cherry-pick -n'
function gbl() {
        record=${1:-5}
        git branch --sort=-committerdate | tail -r | tail -$record
}
function glog() {
	num=${1:-1}
	git log -$num
}
function gcm() {
        msg="-m \"$1\""
        git commit `if [[ "abc$1" != "abc" ]]; then echo "$msg"; fi`
}
```

## docker commands
```shell
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dpl='docker pull'
alias dps='docker ps'
alias dexec='docker exec -it'
alias dsp='docker system prune'
alias dlogin='docker login -u AWS -p `aws ecr get-login-password --region us-east-2` https://333567660568.dkr.ecr.us-east-2.amazonaws.com'
```

## yarn
```shell
alias yi='yarn install'
alias ys='yarn serve'
alias ysp='yarn serve --mode production'
alias yhl='yarn hlint'
alias yd='yarn dockerize'
```
