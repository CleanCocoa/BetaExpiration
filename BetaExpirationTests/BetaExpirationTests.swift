//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.

import XCTest
@testable import BetaExpiration

class BetaExpirationTests: XCTestCase {

    func testNotTimeForUpdateYet() {

        let then = BetaExpiration.expiresAt
        let calendar = Calendar.current
        let threshold = (calendar as NSCalendar).date(byAdding: .day, value: -10, to: then, options: [])!
        let now = Date()
        XCTAssertFalse(now > threshold)
    }

    func testComputeNextExpirationDate() {
        let now = Date()
        let calendar = Calendar.current
        var comps = DateComponents()
        comps.day = 30
        let expiresAt = (calendar as NSCalendar).date(byAdding: comps, to: now, options: [])!
        let interval = expiresAt.timeIntervalSinceReferenceDate
        print(interval)
    }
}
