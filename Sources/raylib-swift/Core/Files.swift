//
//  Files.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import Foundation
import CRaylib


public enum Files {}

public extension Files {
    func load(from filename: String) throws -> Data {
        var bytesRead: UInt32 = 0
        guard let rawBytes = filename.withCString({ cFile in
            LoadFileData(cFile, &bytesRead)
        }) else { throw RaylibError.noData }
        return Data(bytes: rawBytes, count: Int(bytesRead))
    }

    func save(data: Data, to filename: String) {
        var dataCopy = data
        filename.withCString { cFile in
            dataCopy.withUnsafeMutableBytes { bytes in
                SaveFileData(cFile, bytes.baseAddress, UInt32(data.count))
            }
        }
    }
}
