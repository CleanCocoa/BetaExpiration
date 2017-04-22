//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.

import Foundation

public struct Days {

    public static func timeInterval(amount: Double) -> Double {
        return amount * 60 * 60 * 24
    }

    public static func amount(timeInterval: TimeInterval) -> Double {
        return timeInterval / 60 / 60 / 24
    }

    public let amount: Double

    /// Rounded to the next integer.
    public var userFacingAmount: Int {

        return Int(ceil(amount))
    }

    public init(_ anAmount: Double) {
        amount = anAmount
    }

    public var timeInterval: TimeInterval {
        return Days.timeInterval(amount: amount)
    }

    public var isPast: Bool {
        return amount < 0
    }
}

extension Days: CustomStringConvertible {

    public var description: String {
        return "\(userFacingAmount)"
    }
}

extension Days: Equatable { }

public func ==(lhs: Days, rhs: Days) -> Bool {
    
    return lhs.amount == rhs.amount
}
