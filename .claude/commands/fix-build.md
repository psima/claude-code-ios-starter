---
description: Build the app, read compiler errors and fix them until the build succeeds
argument-hint: [scheme]
---

Fix the build for scheme: $ARGUMENTS (if empty, run `xcodebuild -list` and pick the app scheme).

1. Find an available simulator with `xcrun simctl list devices available` and pick a recent iPhone. Never guess a device name.
2. Build:
   `xcodebuild build -scheme <scheme> -destination 'platform=iOS Simulator,name=<device>' -quiet 2>&1 | tail -n 80`
   Use `-workspace` instead of `-project` if a .xcworkspace exists.
3. If the build fails, read the first errors, open the files involved and fix the root cause. Fix errors in order; later errors are often caused by earlier ones.
4. Rebuild. Repeat until the build succeeds, up to 5 attempts.

Rules:
- Never edit .pbxproj, schemes or entitlements. If a file is missing from the target, tell me which file to add.
- Never silence Swift concurrency errors with `@unchecked Sendable`, `nonisolated(unsafe)` or `@preconcurrency` unless you explain why it is safe.
- Don't delete code or tests to make the build pass.

Finish with a short summary of what was wrong and what you changed.
