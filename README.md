# Claude Code iOS Starter

A free, drop-in `.claude/` setup that makes [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) safer and more useful on Xcode projects.

Out of the box, AI coding agents trip over iOS projects. They:

- hand-edit `project.pbxproj` and break the project
- guess simulator names, so `xcodebuild` fails
- "fix" Swift 6 concurrency errors with `@unchecked Sendable`
- mix up `@State`, `@Bindable` and `@Observable`

This starter fixes the worst of it.

## What's included

| File | What it does |
|---|---|
| `.claude/hooks/protect-xcode-files.sh` | Blocks edits to `.pbxproj`, `.xcscheme`, `.entitlements` and shared workspace data |
| `.claude/hooks/format-swift.sh` | Runs `swift-format` on every Swift file Claude touches |
| `.claude/settings.json` | Lets builds and tests run without approval prompts; keeps `.p8`, `.p12`, provisioning profiles and `.env` off-limits |
| `.claude/commands/fix-build.md` | `/fix-build`: builds, reads compiler errors, fixes them and loops until the build is green |
| `CLAUDE.md` | Template for a SwiftUI app: build commands, project rules and layout |

## Install

From the root of your Xcode project:

```bash
git clone https://github.com/psima/claude-code-ios-starter /tmp/cc-ios
cp -Rn /tmp/cc-ios/.claude .
cp -n /tmp/cc-ios/CLAUDE.md .
```

`-n` means existing files are never overwritten. Then fill in the placeholders in `CLAUDE.md`, start `claude`, and try:

```
/fix-build MyApp
```

Requirements: macOS, Xcode 16+, Claude Code.

## Want the full kit?

**[Claude Code for iOS Developers: The Complete Kit](https://psimas.gumroad.com/l/claude-code-ios?code=LAUNCH30)** builds on this starter with:

- 9 slash commands: `/new-feature`, `/fix-build`, `/write-tests`, `/swiftui-review`, `/swift6-migrate`, `/localize`, `/crash-triage`, `/release-notes`, `/accessibility-pass`
- 4 subagents: SwiftUI reviewer, Swift Testing engineer, accessibility auditor, Swift concurrency expert
- 3 CLAUDE.md templates (SwiftUI, UIKit → SwiftUI, Swift package) + `CLAUDE.local.md`
- 60-prompt iOS library
- 19-page PDF guide with 7 complete workflows and a cheat sheet
- One-command installer

Launch discount: 30% off with code `LAUNCH30`.

## License

MIT
