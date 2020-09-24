//
//  DrawContext.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib

enum DrawContext {
    static func draw(_ drawing: () -> Void) {
        BeginDrawing()
        drawing()
        EndDrawing()
    }

    static func clearBackground(color: Color) {
        ClearBackground(color.rlColor)
    }
}
