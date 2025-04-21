#!/bin/bash

set -ex

export PLAN9=$HOME/plan9port
export PATH=$PATH:$PLAN9/bin
export MANPATH=$MANPATH:$PLAN9/man
export TERM=dumb
export MANPAGER=nobs
export PAGER=nobs
export EDITOR=E
# export SHELL=/bin/bash
# export acmeshell=/bin/bash

export tabstop=4
unset FCEDIT VISUAL

# Launch fontsrv
[ -z "$(pgrep fontsrv)" ] && 9 fontsrv &

# Launch plumber
[ -z "$(pgrep plumber)" ] && 9 plumber;
cat $HOME/lib/plumbing $PLAN9/plumb/initial.plumbing | 9 9p write plumb/rules

# Boot acme
9 acme -f /mnt/font/Menlo-Regular/14a/font
