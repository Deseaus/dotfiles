#!/usr/bin/env bash
# maglev.tmux (tmux/plugins/maglev, vendored via TPM, gitignored) builds
# status-right with a stray leading glyph and a dead #{prefix_highlight}
# reference (that plugin isn't installed), both styled colour8-on-colour0 -
# low enough contrast on a dark status bar to disappear. Strip that whole
# broken preamble so the clock/date fall back to the readable default
# status-style colour instead.
current=$(tmux show-options -gqv status-right)
marker='#{prefix_highlight} '

case "$current" in
    *"$marker"*)
        fixed=${current#*"$marker"}
        tmux set-option -g status-right "$fixed"
        ;;
esac
