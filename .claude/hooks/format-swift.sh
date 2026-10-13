#!/bin/bash
# PostToolUse hook: format every Swift file Claude edits.
# Uses swift-format bundled with Xcode 16+. Never blocks.

input=$(cat)
file_path=$(printf '%s' "$input" | /usr/bin/python3 -c 'import sys, json; print(json.load(sys.stdin).get("tool_input", {}).get("file_path", ""))' 2>/dev/null)

if [[ "$file_path" == *.swift && -f "$file_path" ]]; then
  xcrun swift-format format --in-place "$file_path" >/dev/null 2>&1 || true
fi

exit 0
