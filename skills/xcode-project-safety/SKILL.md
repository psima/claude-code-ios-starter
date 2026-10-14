---
name: xcode-project-safety
description: How to build, test and change iOS/macOS Xcode projects safely. Use when working in a repo with an .xcodeproj, .xcworkspace or Package.swift, when running xcodebuild or simulators, or when fixing Swift 6 concurrency or SwiftUI errors.
---

# Working safely in Xcode projects

## Never hand-edit project files
Do not edit `project.pbxproj`, `.xcscheme`, `.entitlements` or anything under `xcshareddata/`. These files break easily and merge badly.
- To add a source file: create it on disk, then tell the user which target to add it to in Xcode.
- If the repo has `project.yml` (XcodeGen) or `Project.swift` (Tuist), edit that and regenerate instead.

## Build and test
1. Find the project: prefer `*.xcworkspace` over `*.xcodeproj`. Run `xcodebuild -list` to get schemes.
2. Find a real simulator with `xcrun simctl list devices available`. Never invent a device name.
3. Build: `xcodebuild build -scheme <Scheme> -destination 'platform=iOS Simulator,name=<Device>' -quiet 2>&1 | tail -n 80`
4. Test: same command with `test` instead of `build`.
5. Swift packages: `swift build` and `swift test`.

`-quiet` keeps output small; full xcodebuild logs waste context.

## Fixing errors
- Read the first errors and fix their root cause; later errors often follow from earlier ones.
- Rebuild after each fix. Stop after 5 failed attempts and summarize what is blocking.
- Do not delete code or tests to make a build pass.

## Swift 6 concurrency
Fix data-race errors properly: `@MainActor` for UI state, actors for shared mutable state, `Sendable` value types. Do not add `@unchecked Sendable`, `nonisolated(unsafe)` or `@preconcurrency` unless you explain in a comment why it is safe.

## SwiftUI state
Use the Observation framework in new code: `@Observable` models, `@State` for owned models, `@Bindable` for bindings into them, `@Environment` for shared models. Avoid `ObservableObject` in new code. Give new views a `#Preview`.

## Secrets
Never read or print `.p8`, `.p12`, `.mobileprovision` or `.env` files.
