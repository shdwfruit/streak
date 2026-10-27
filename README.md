# streak

A tiny daily-habit tracker for the terminal. Every new terminal shows today's checklist:

```
  ✅ read         ■■■■■■■  🔥 13
  ⬜ gym          ·■■·■■·  🔥 2
  ⬜ code         ··■■■■·  🔥 4
```

The squares are the last 7 days (today on the right), and 🔥 is the current streak. A streak
stays alive until midnight, so not having done a task yet today doesn't break it.

## Install

Needs zsh (macOS has it; on Linux, `apt install zsh` or similar). Your own shell can be zsh or bash.

```sh
git clone https://github.com/shdwfruit/streak ~/.local/share/streak
~/.local/share/streak/install.sh
```

Then open a new terminal. The script links `streak` into `~/.local/bin` and adds one line to
your `~/.zshrc` or `~/.bashrc`, so keep the folder. Update with `git -C ~/.local/share/streak pull`.

## Use

| Command | What it does |
| --- | --- |
| `streak add read` | Add a task to the checklist (`streak rm read` removes it) |
| `did read` | Mark it done today (same as `streak done read`); `streak undo read` takes it back |
| `streak` | Show the checklist |
| `streak todo` | List what's left today |
| `streak -v` | Dashboard: heatmaps, weekly completion, completion by weekday, best streaks (`streak -v 12` for a year) |

Your tasks and history are two plain text files in `~/.streaks/` (set `STREAK_DIR` to keep
them elsewhere). To stop the checklist showing in every new terminal, put `STREAK_QUIET=1` above
the line `install.sh` added.

To uninstall, delete `~/.local/bin/streak` and that line, then the clone and `~/.streaks/`.
