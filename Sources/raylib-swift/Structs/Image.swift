//
//  Image.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public struct Image {
    internal var rlImage: CRaylib.Image

    public init(fileName: String) {
        self.rlImage = fileName.withCString(LoadImage(_:))
    }
}
