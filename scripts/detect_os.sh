#!/usr/bin/env bash
set -euo pipefail

uname_s=$(uname -s)
case "${uname_s}" in
    Darwin) echo "macos" ;;
    Linux)
        if grep -qi microsoft /proc/version 2>/dev/null; then
            echo "wsl"
        else
            echo "linux"
        fi
        ;;
    *) echo "linux" ;;
esac
