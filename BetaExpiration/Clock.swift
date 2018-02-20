//  Copyright © 2017 Christian Tietze. All rights reserved. Distributed under the MIT License.

import struct Foundation.Date

public protocol Clock {
    func now() -> Date
}

public struct SystemClock: Clock {
    public init() { }
    
    public func now() -> Date {
        return Date()
    }
}
