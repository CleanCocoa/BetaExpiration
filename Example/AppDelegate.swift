//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.

import Cocoa
import BetaExpiration

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // BetaExpiration.guardExpiration()

        BetaExpiration.decorate(
            window: self.window,
            hostBundle: Bundle.main)
    }

}

