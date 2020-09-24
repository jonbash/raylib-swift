//
//  Rect.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//


public struct Rect {
    public var origin: Vector2
    public var size: Size

    public init(origin: Vector2, size: Size) {
        self.origin = origin
        self.size = size
    }
}
