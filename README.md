
### Simple repository with list of commonly used developer friendly commands, help reduce time and increase productivity.
  
List of commonly used developer friendly commands, save the file in your default user directory and these commands would be available in all the instances of the terminal.

#### linux
save the `bashrc` file as `.bashrc` in your default user directory `echo ~`  
or  
simply use command `source bashrc` locally.  

#### mac
save the `bash_profile` file as `.bash_profile` in your default user directory `echo ~`  
or  
simply use command `source bash_profile` locally.  

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
alias gsl='git stash list'
function gss() {
	git stash save "$1"
}
function gsp() {
	snum=${1:-0}
	git stash pop "stash@{`echo $snum`}"
}
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
	force=${1:-no}
	git push origin `if [[ ${force} == "-f" ]]; then echo "+";  fi`$(gbc | awk '{print $2}')
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
alias grh='git reset --hard'
function grs() {
	num=${1:-1}
	git reset --soft HEAD~$num
}
function gcm() {
	msg="-m \"$1\""
	git commit  `if [[ "abc$1" != "abc" ]]; then echo "$msg"; fi`
}
alias gcc='git commit -c ORIG_HEAD'
```

## docker commands
```shell
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dpl='docker pull'
alias dps='docker ps'
alias dexec='docker exec -it'
alias dsp='docker system prune'
```

## yarn
```shell
alias yi='yarn install'
alias ys='yarn serve'
alias ysp='yarn serve --mode production'
alias yhl='yarn hlint'
alias yd='yarn dockerize'
alias yb='yarn build'
```
