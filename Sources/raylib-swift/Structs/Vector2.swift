//
//  Vector2.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public struct Vector2 {
    private var rlVector2: CRaylib.Vector2

    internal init(_ rlVector2: CRaylib.Vector2) {
        self.rlVector2 = rlVector2
    }

    public init(x: Float, y: Float) {
        rlVector2 = CRaylib.Vector2(x: x, y: y)
    }
}


public extension Vector2 {
    var x: Float {
        get { rlVector2.x }
        set { rlVector2.x = newValue }
    }
    var y: Float {
        get { rlVector2.y }
        set { rlVector2.y = newValue }
    }
}
