//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.

import Cocoa

public struct BetaExpiration {

    public static let expiresAt = Date(timeIntervalSinceReferenceDate: 517132777)

    public static func daysLeft(_ clock: Clock = SystemClock()) -> Days {

        let interval = expiresAt.timeIntervalSince(clock.now())
        let amount = Days.amount(timeInterval: interval)
        return Days(amount)
    }

    public static func isExpired(_ clock: Clock = SystemClock()) -> Bool {

        return clock.now() > expiresAt
    }

    public static func guardExpiration() {

        if !isExpired() { return }

        let alert = NSAlert()
        alert.messageText = "Your beta has expired. Please download a new version or get in touch:\nhi@christiantietze.de"
        alert.addButton(withTitle: "Quit")
        alert.runModal()
        NSApp.terminate(nil)
    }

    /// Puts a titlebar accessory into the window, for example:
    ///
    ///     β v1.2.0 (107) - 23 days left
    ///         ^      ^     ^
    ///         |      |     |__  = (today - expiration date)
    ///         |      |
    ///         |      |__ build number
    ///         |
    ///         |__ version
    ///
    /// - parameter window: Window where the `NSTitlebarAccessoryViewController`
    ///   is added to.
    /// - parameter hostBundle: The app's `Bundle` to obtain metadata.
    public static func decorate(window: NSWindow?, hostBundle: Bundle) {

        guard let window = window else { return }

        let viewController = BetaExpirationViewController()
        window.addTitlebarAccessoryViewController(viewController.titlebarAccessoryViewController())

        let viewModel = BetaExpirationViewModel(
            bundle: hostBundle,
            daysLeft: String(describing: daysLeft()))
        viewController.display(viewModel: viewModel)
    }
}

extension BetaExpirationViewModel {

    public init(bundle: Bundle, daysLeft: String) {

        self.init(
            version: bundle.infoDictionary?["CFBundleShortVersionString"] as? String ?? "?",
            build: bundle.infoDictionary?["CFBundleVersion"] as? String ?? "?",
            daysLeft: daysLeft)
    }
}
