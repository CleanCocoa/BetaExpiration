//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.

import Cocoa

public class BetaExpirationViewController: NSViewController {

    public convenience init() {
        self.init(nibName: "BetaExpirationViewController", bundle: Bundle(for: BetaExpirationViewController.self))!
    }

    @IBOutlet weak var label: NSTextField!

    public override func awakeFromNib() {
        super.awakeFromNib()

        label.drawsBackground = true
    }

    /// Expects `label` to have the following text in Interface Builder:
    /// DD days left (VVVV)
    public func display(viewModel: BetaExpirationViewModel) {

        label.stringValue = label.stringValue
            .replacingOccurrences(of: "DD", with: "\(viewModel.daysLeft)")
            .replacingOccurrences(of: "VVVV", with: viewModel.version)
            .replacingOccurrences(of: "BB", with: viewModel.build)
    }

    public func titlebarAccessoryViewController() -> NSTitlebarAccessoryViewController {

        let accessoryViewController = NSTitlebarAccessoryViewController()
        accessoryViewController.view = view
        accessoryViewController.layoutAttribute = .right

        return accessoryViewController
    }
}
