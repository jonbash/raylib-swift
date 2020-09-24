//
//  Vector2.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public struct Vector2 {
    internal var rlVector: CRaylib.Vector2

    internal init(_ rlVector: CRaylib.Vector2) {
        self.rlVector = rlVector
    }

    public init(x: Float, y: Float) {
        rlVector = CRaylib.Vector2(x: x, y: y)
    }
}


public extension Vector2 {
    var x: Float {
        get { rlVector.x }
        set { rlVector.x = newValue }
    }
    var y: Float {
        get { rlVector.y }
        set { rlVector.y = newValue }
    }
}


// MARK: - Vector3

public struct Vector3 {
    internal var rlVector: CRaylib.Vector3

    internal init(_ rlVector: CRaylib.Vector3) {
        self.rlVector = rlVector
    }

    public init(x: Float, y: Float, z: Float) {
        rlVector = CRaylib.Vector3(x: x, y: y, z: z)
    }
}


public extension Vector3 {
    var x: Float {
        get { rlVector.x }
        set { rlVector.x = newValue }
    }
    var y: Float {
        get { rlVector.y }
        set { rlVector.y = newValue }
    }
    var z: Float {
        get { rlVector.y }
        set { rlVector.y = newValue }
    }
}
