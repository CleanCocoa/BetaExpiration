//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.

public struct BetaExpirationViewModel {

    public let version: String
    public let build: String
    public let daysLeft: String

    public init(version: String, build: String, daysLeft: String) {

        self.version = version
        self.build = build
        self.daysLeft = daysLeft
    }
}
