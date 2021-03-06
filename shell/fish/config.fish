# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eltonpinto/google-cloud-sdk/path.fish.inc' ]; . '/Users/eltonpinto/google-cloud-sdk/path.fish.inc'; end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/eltonpinto/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/eltonpinto/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/eltonpinto/.ghcup/bin $PATH

# opam configuration
source /Users/eltonpinto/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH
# Setting PATH for Python 3.9
# The original version is saved in /Users/eltonpinto/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"
