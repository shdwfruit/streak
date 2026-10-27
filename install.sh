#!/bin/sh
# install.sh — puts `streak` on your PATH (~/.local/bin) and has new shells load streak.sh
# (the `did` alias and today's checklist). Safe to run again. Keep this folder: both point into it.
set -e
here=$(cd "$(dirname "$0")" && pwd)
command -v zsh >/dev/null || { echo "streak needs zsh: brew install zsh, or apt install zsh"; exit 1; }

mkdir -p "$HOME/.local/bin"
ln -sf "$here/streak" "$HOME/.local/bin/streak"
echo "linked ~/.local/bin/streak"

case $(basename "${SHELL:-}") in
  zsh)  rc=$HOME/.zshrc ;;
  bash) rc=$HOME/.bashrc ;;
  *)    echo "add this line to your shell's startup file:  . \"$here/streak.sh\""; exit 0 ;;
esac
line=". \"$here/streak.sh\""
if grep -qxF "$line" "$rc" 2>/dev/null; then
  echo "$rc already loads streak"
else
  printf '\n# streak (daily habit tracker)\n%s\n' "$line" >> "$rc"
  echo "added streak to $rc"
fi
echo "open a new terminal, then: streak add <task>"
