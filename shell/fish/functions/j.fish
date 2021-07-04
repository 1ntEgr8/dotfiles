function j
    function _j_update -S
        find $journal -name "*-*-*" | sort -r | read -L current previous
        if test -e "$previous"
            nvim -c "lefta vsplit $journal/CHECKPOINT | split $previous" $current
        else
            nvim -c "lefta vsplit $journal/CHECKPOINT" $current
        end
    end

    function _j_checkpoint -S
        find $journal -name "*-*-*" | sort -r | read -L latest
        nvim -c "lefta vsplit $latest | split $journal/TODOS" $journal/CHECKPOINT
    end

    function _j_regular -S
        if ! set -q _flag_v
            set -l timestamp (date +"%H:%M")
            echo "[$timestamp]" >> $today
        end
        nvim "+set textwidth=80" "+norm Go" $today
    end

    set -l journal ~/.journal

    if test ! -e "$journal"
        mkdir $journal
        touch $journal/{TODOS,CHECKPOINT}
        echo "created journal at $journal"
    end

    argparse "u/update" "c/checkpoint" "v/view" -- $argv

    set -l today $journal/(date  +"%Y-%m-%d")
    if test ! -e $today
        touch $today
        echo "new journal entry: $today"
    end

    if set -q _flag_u
        _j_update
    else if set -q _flag_c
        _j_checkpoint
    else
        _j_regular
    end
end
