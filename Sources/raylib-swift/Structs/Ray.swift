//
//  Ray.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public struct Ray {
    internal var rlRay: CRaylib.Ray

    internal init(_ rlRay: CRaylib.Ray) {
        self.rlRay = rlRay
    }
}

public extension Ray {
    
}
