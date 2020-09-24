//
//  WindowConfiguration.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//


public struct WindowConfiguration: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let reserved          = WindowConfiguration(rawValue: 1)
    public static let fullscreenMode    = WindowConfiguration(rawValue: 2)
    public static let windowResizable   = WindowConfiguration(rawValue: 4)
    public static let windowTransparent = WindowConfiguration(rawValue: 16)
    public static let windowHidden      = WindowConfiguration(rawValue: 128)
    public static let windowAlwaysRun   = WindowConfiguration(rawValue: 256)
    public static let msaa4xHint        = WindowConfiguration(rawValue: 32)
    public static let vsyncHint         = WindowConfiguration(rawValue: 64)
}
