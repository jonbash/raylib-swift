//
//  DrawContext.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public class DrawContext {
    internal init() {
        BeginDrawing()
    }

    deinit {
        EndDrawing()
    }
}

public extension DrawContext {
    /// Storing `DrawContext` outside of closure will break things. Only use the context for drawing within the closure.
    static func draw(_ drawing: (DrawContext) -> Void) {
        let context = DrawContext()
        drawing(context)
    }

    static func inMode2D(withCamera camera: )

    func clearBackground(color: Color) {
        ClearBackground(color.rlColor)
    }


}
