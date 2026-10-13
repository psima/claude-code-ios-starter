#!/bin/bash
# PreToolUse hook: stop Claude from hand-editing Xcode project files.
# Exit code 2 blocks the tool call and sends stderr back to Claude.

input=$(cat)
file_path=$(printf '%s' "$input" | /usr/bin/python3 -c 'import sys, json; print(json.load(sys.stdin).get("tool_input", {}).get("file_path", ""))' 2>/dev/null)

case "$file_path" in
  *.pbxproj|*.xcscheme|*.entitlements|*.xcworkspacedata|*/xcshareddata/*)
    echo "Blocked: $file_path is an Xcode project file and must not be edited by hand. Add new files on disk only, then tell the user which files to add to the target in Xcode (or regenerate with XcodeGen/Tuist if the project uses them)." >&2
    exit 2
    ;;
esac

exit 0
