<p align="center"><img src="Resources/Brand/YuzuIcon.png" width="128" alt="Yuzu"></p>
<h1 align="center">Yuzu</h1>
<p align="center">Drag a file, spin the wheel, get what you need. · Dosyanı sürükle, çarkı çevir, istediğini al.</p>

Yuzu is a personal macOS file conversion and editing app. It is a fork of
[Nashi](https://github.com/orkunisitmak/nashi-app) by Orkun Işıtmak, kept
macOS-only and renamed. All of Nashi's tools are here: the drag-and-wheel
converter (27 tools, 46 input formats), crop, video trim, QR reading, public
web-media downloads, the Library and System/Light/Dark appearance. Conversion
and editing run on your Mac.

## Download

**[Yuzu-macOS-arm64.zip](https://github.com/__GITHUB_USER__/yuzu-app/releases/latest/download/Yuzu-macOS-arm64.zip)** · Apple Silicon, macOS 13 or later · [All releases](https://github.com/__GITHUB_USER__/yuzu-app/releases)

1. Unzip it and move **Yuzu.app** to **Applications**.
2. Open it. Yuzu is not notarized by Apple, so the first time macOS may refuse.
   Open **System Settings → Privacy & Security** and choose **Open Anyway**.
3. On first launch choose **Finish setup → Download missing tools** to install
   the media and Office tools (hash-verified, from upstream). Image and PDF
   tools work immediately.

Yuzu checks this repository's releases for signed updates.

## Shortcuts

Hold **Shift** while dragging in Finder to convert, **Command** for tools or
**Control** for file actions. **Control–Shift–D** downloads a copied public link.
In media editors: **Space** play/pause, **←/→** seek, **I/O** mark a range.
Crop: drag, **Shift** locks the aspect ratio, **Enter** saves.

## Build it yourself

Apple Silicon Mac, macOS 13+, Xcode with Swift 6:

```sh
scripts/setup-exiftool.sh
swift build --product Yuzu
scripts/build-app.sh release   # → build/Yuzu.app
```

## Release

Releases are built on GitHub's Mac runners: **Actions → Release Yuzu → Run
workflow**, enter a version (e.g. `1.0.1`) and a build number larger than the
last one. The workflow needs the `SPARKLE_PRIVATE_KEY` repository secret, which
signs the update feed. Never commit that key.

## Working with AI agents

Claude Code and Codex share the instructions in [AGENTS.md](AGENTS.md).

## License

MIT, see [LICENSE](LICENSE). Original work © Orkun Işıtmak and Nashi
contributors. Third-party tools keep their own licenses:
[notices](Resources/THIRD-PARTY-NOTICES.txt), [runtime setup](docs/dependencies.md).
Not affiliated with Tangerine or LEAP STUDIO.
