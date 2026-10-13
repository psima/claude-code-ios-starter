# Project: <App name>

SwiftUI app, iOS 17+, Swift 6 language mode.

## Build & test
- Workspace/project: `<App>.xcodeproj`
- App scheme: `<App>` · Test scheme: `<App>Tests`
- Find a simulator first: `xcrun simctl list devices available`. Never invent a device name.
- Build: `xcodebuild build -scheme <App> -destination 'platform=iOS Simulator,name=<device>' -quiet`
- Test: `xcodebuild test -scheme <App> -destination 'platform=iOS Simulator,name=<device>' -quiet`

## Rules
- Do not edit `.pbxproj`, `.xcscheme` or `.entitlements` files. Create new Swift files on disk and tell me which target to add them to.
- Use the Observation framework (`@Observable`, `@Bindable`, `@State` for owned models). Do not use `ObservableObject` in new code.
- Use Swift Testing (`import Testing`, `@Test`, `#expect`) for new tests.
- Fix concurrency errors properly (actors, `@MainActor`, `Sendable` types). No `@unchecked Sendable` without a comment explaining why.
- Every new SwiftUI view gets a `#Preview`.
- Keep views small. Move logic into models that can be tested.

## Project layout
- `Sources/Features/<Feature>/` – views + models per feature
- `Sources/Core/` – networking, persistence, shared utilities
- `Tests/` – unit tests mirroring `Sources/`
