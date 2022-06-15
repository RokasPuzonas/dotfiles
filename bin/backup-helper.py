#!/bin/python
import os

src = os.getenv("HOME")
dest = "file:///mnt/"
include = [
    f"{src}/.dotfiles",
    f"{src}/.zshenv",
    f"{src}/documents",
    f"{src}/pictures",
    f"{src}/videos",
    f"{src}/templates",
    f"{src}/music",
    f"{src}/code",
    f"{src}/notes",
    f"{src}/.timewarrior",
    f"{src}/.factorio",
    f"{src}/.config",
    f"{src}/.ssh",
    f"{src}/.gnupg",

    f"{src}/.gitconfig",
    f"{src}/.gitignore",
    f"{src}/.gitmodules",
    f"{src}/.tmux.conf",
    f"{src}/.Xresources",
    f"{src}/.password-store",
    f"{src}/.minecraft",

    f"{src}/.timewarrior",
    f"{src}/.local/share/task",
    f"{src}/.local/share/TIS-100",
    f"{src}/.local/share/minecraft",
    f"{src}/.local/share/multimc",
    f"{src}/.local/share/zathura",
    f"{src}/.local/share/SuperMeatBoy",
    f"{src}/.local/share/Mindustry",
    f"{src}/.local/share/nautilus",
    f"{src}/.local/share/taskwarrior-tui",
]

exclude = [
    src,
    "**/node_modules",
    "**/*cache",
    f"{src}/.cache",
    "**/Cache",
    "**/venv",
    f"{src}/.config/itch",

    # Rust build directories
    "**/target/debug",
    "**/target/release",
]
all_includes = " ".join(f'--include "{path}"' for path in include)
all_excludes = " ".join(f'--exclude "{path}"' for path in exclude)


cmd = f'sudo duplicity incr --volsize 256 --asynchronous-upload --archive-dir "/home/puzonas/.cache/duplicity" --progress --no-encryption {all_includes} {all_excludes} "{src}" "{dest}"'
print(cmd)
# os.system(cmd)
