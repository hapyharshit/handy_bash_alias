# git commands
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
function gsa() {
	snum=${1:-0}
	git stash apply "stash@{`echo $snum`}"
}
alias gpl='git pull && git remote prune origin'
alias gma='git merge --abort'
function gm() {
	# "i" - accept incoming change
	# "c" - accept current change
	git merge $1 `if [[ $2 == "i" ]]; then echo "--strategy-option theirs"; fi` `if [[ $2 == "c" ]]; then echo "--strategy-option ours"; fi`;
}
alias gt='git tag'
alias gtd='git tag --delete'
alias gbd='git branch -D'
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
function gdr() {
	nb=${2:-cherry-pick_from_develop}
	gcd && gpl && gc release/2.0 && gpl && gcb $nb && gcp $1
}
function grd() {
	nb=${2:-cherry-pick_from_release}
	gc release/2.0 && gpl && gcd && gpl && gcb $nb && gcp $1
}


# docker commands
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dpl='docker pull'
alias dps='docker ps'
alias dpsg='docker ps | grep'
alias dexec='docker exec -it'
alias dlogs='docker logs -f'
alias dsp='docker system prune'

# yarn
alias yi='yarn install'
alias ys='yarn serve'
alias ysp='yarn serve --mode production'
alias yhl='yarn hlint'
alias yfl='yarn fixlint'
alias yd='yarn dockerize'
alias yb='yarn build'
