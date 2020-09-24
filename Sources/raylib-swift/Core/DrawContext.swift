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

    static func scissorDraw(rect: Rect, _ drawing: () -> Void) {
        BeginScissorMode(
            Int32(rect.origin.x),
            Int32(rect.origin.y),
            rect.size.width32,
            rect.size.height32)
        drawing()
        EndScissorMode()
    }
}
