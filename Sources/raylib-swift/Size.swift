//
//  Size.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//


public struct Size {
    internal var width32: Int32
    internal var height32: Int32

    internal init(width: Int32, height: Int32) {
        self.width32 = width
        self.height32 = height
    }
}

public extension Size {
    init(width: Int, height: Int) {
        self.width32 = Int32(width)
        self.height32 = Int32(height)
    }
    
    var width: Int {
        get { Int(width32) }
        set { width32 = Int32(newValue) }
    }
    var height: Int {
        get { Int(height32) }
        set { height32 = Int32(newValue) }
    }
}
