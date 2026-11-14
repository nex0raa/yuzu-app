import Foundation

/// SwiftPM's generated `Bundle.module` only looks next to the .app and in the
/// original build folder. A packaged app keeps the bundle in Contents/Resources,
/// so look there first and fall back to `Bundle.module` for `swift test`/CLI.
enum NashiResourceBundle {
    static let bundle: Bundle = {
        let name = "Nashi_NashiCore.bundle"
        for base in [Bundle.main.resourceURL, Bundle.main.bundleURL, Bundle.main.executableURL?.deletingLastPathComponent()] {
            if let base, let found = Bundle(url: base.appendingPathComponent(name, isDirectory: true)) { return found }
        }
        return Bundle.module
    }()
}
