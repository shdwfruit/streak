# streak — loaded by your shell's startup file (install.sh adds the line). Works in zsh and bash.
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
alias did='streak done'     # did read

# today's checklist in every new terminal; set STREAK_QUIET=1 above the source line to skip it
[ -t 1 ] && [ -z "$STREAK_QUIET" ] && streak
