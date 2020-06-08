set SCRET "$HOME/dev/.scret"

set EDITOR "vim"

# aliases
alias yalla="exit"
alias ls="exa -F"
# alias hn="$HOME/Documents/Projects/hn/target/release/hn"
alias brave="open -a 'Brave Browser'"
alias duck="$SCRET/.duck.sh"
alias j="$SCRET/.journal.sh"
alias w="vim '+norm Go' '+startinsert' '$SCRET/.lanruoj/wandump.md'"

# hackgt
alias hackgt="cd $HOME/Documents/projects/hackgt"
alias slack="open -a 'Slack'"

# rust
source "$HOME/.cargo/env"

# golang
export GOPATH="$HOME/dev/bogo"

# circuitsim
alias csim="open $HOME/college/software/circuitsim/CircuitSim1.8.2.app/Contents/Java/CircuitSim.jar"

export PATH="$PATH:/opt/local/bin"
