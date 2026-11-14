# Yuzu: instructions for AI coding agents

This file is read by Codex and, through CLAUDE.md, by Claude Code. Both agents
work on the same repository, so follow the same rules.

## Project
- Yuzu is a personal, macOS-only (Apple Silicon, macOS 13+) fork of Nashi.
- Swift 6 + SwiftPM. Executable product: `Yuzu`. Internal module and folder
  names keep the `Nashi` prefix (`NashiCore`, `NashiApp`, `NashiUpdates`) on
  purpose; do not rename them.
- User-visible text says "Yuzu". UI strings come from
  `Sources/NashiCore/Resources/Turkish.json` and `French.json`; after editing
  them run `python3 scripts/generate-localizations.py`.
- Never edit `Sources/TangerineUpdates/UpdateCredentialBrokerProtocol.swift`:
  it is a frozen wire protocol.

## Build and test (macOS only)
```sh
scripts/setup-exiftool.sh
swift build --product Yuzu
swift test --filter NashiUpdatesTests
scripts/build-app.sh release
```
On Linux you cannot build the app; run the Python checks instead:
`python3 scripts/generate-localizations.py --check` and
`python3 scripts/audit-public-tree.py`.

## Working together (Claude Code + Codex)
- One agent per branch. Name branches `claude/<topic>` or `codex/<topic>`.
- Never work on `main` directly; open a pull request and let the
  "Source checks" workflow pass before merging.
- Before starting, `git pull` and read open pull requests so you do not
  duplicate or overwrite the other agent's work.
- Keep commits small, with a clear message saying what and why.
- Write handoff notes for the other agent in the pull request description:
  what changed, what is left, how to test it.

## Never
- Commit secrets. The update signing key lives only in the
  `SPARKLE_PRIVATE_KEY` GitHub secret.
- Change `Configuration/Updates*.plist` or the `SUPublicEDKey` in
  `Resources/Info.plist` unless asked: installed copies would stop updating.
- Remove the original copyright line from LICENSE or third-party notices.
- Publish a release or push to `main` without the owner's approval.
