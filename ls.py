#!/usr/bin/env python3

import os
import sys
import stat
from datetime import datetime

def list_files(path=".", show_hidden=False, detailed=False):
    try:
        entries = os.listdir(path)
        if not show_hidden:
            entries = [entry for entry in entries if not entry.startswith('.')]
        entries.sort()

        for entry in entries:
            if detailed:
                entry_path = os.path.join(path, entry)
                stats = os.stat(entry_path)
                mode = stat.filemode(stats.st_mode)
                size = stats.st_size
                mtime = datetime.fromtimestamp(stats.st_mtime).strftime("%Y-%m-%d %H:%M")
                print(f"{mode} {size:>8} {mtime} {entry}")
            else:
                print(entry)

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

def main():
    show_hidden = False
    detailed = False
    path = "."

    # Parse arguments
    for arg in sys.argv[1:]:
        if arg.startswith("-"):
            if "a" in arg:
                show_hidden = True
            if "l" in arg:
                detailed = True
            if arg.startswith("--color="):
                # Ignore --color options
                pass
            elif arg not in ("-a", "-l", "-la", "-al") and not arg.startswith("--color="):
                print(f"Unsupported option: {arg}", file=sys.stderr)
                sys.exit(1)
        else:
            path = arg

    list_files(path, show_hidden, detailed)

if __name__ == "__main__":
    main()
