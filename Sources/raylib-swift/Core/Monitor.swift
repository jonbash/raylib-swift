//
//  Monitor.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public struct Monitor {
    public let rawValue: Int32

    public init?(_ rawValue: Int32) {
        guard rawValue >= 0 && rawValue < Monitor.count else { return nil }
        self.rawValue = rawValue
    }
}

public extension Monitor {
    var size: Size {
        Size(width: GetMonitorWidth(rawValue),
             height: GetMonitorHeight(rawValue))
    }
    var physicalSize: Size {
        Size(width: GetMonitorPhysicalWidth(rawValue),
             height: GetMonitorPhysicalHeight(rawValue))
    }
    var name: String { String(cString: GetMonitorName(rawValue)) }
}

public extension Monitor {
    static var count: Int32 { GetMonitorCount() }

    static var allCases: [Monitor] {
        (0..<count).compactMap(Monitor.init)
    }
}
