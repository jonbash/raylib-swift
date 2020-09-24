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

    func inMode2D(withCamera camera: Camera2D, perform: () -> Void) {
        BeginMode2D(camera.rlCamera)
        perform()
        EndMode2D()
    }

    func inMode3D(withCamera camera: Camera3D, perform: () -> Void) {
        BeginMode3D(camera.rlCamera)
        perform()
        EndMode3D()
    }

    func inTextureMode(_ target: RenderTexture2D, perform: () -> Void) {
        BeginTextureMode(target)
        perform()
        EndTextureMode()
        let x = RenderTexture2D(
    }

    func clearBackground(color: Color) {
        ClearBackground(color.rlColor)
    }


}
