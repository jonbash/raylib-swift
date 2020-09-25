//
//  Log.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public enum TraceLogType: Int32 {
    case all = 0
    case trace
    case debug
    case info
    case warning
    case error
    case fatal
    case none
}


public enum TraceLog {}

public extension TraceLog {
    static func setLogMinimum(_ logType: TraceLogType) {
        SetTraceLogLevel(logType.rawValue)
    }

    static func setExitMinimum(_ logType: TraceLogType) {
        SetTraceLogExit(logType.rawValue)
    }

    /// TODO: Currently does nothing due to error attempting to implement
    static func setCallback(_ callback: @escaping () -> Void) {
//        SetTraceLogCallback { _, _, _ in
//            callback()
//        }
    }

    /// TODO: Currently unavailable due to inability to implement
    static func log(_ logtype: TraceLogType, text: String...) {
//        CRaylib.TraceLog(logtype.rawValue, text)
    }
}
