//
//  Camera.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public struct Camera2D {
    internal var rlCamera: CRaylib.Camera2D

    init(_ rlCamera: CRaylib.Camera2D) {
        self.rlCamera = rlCamera
    }
}

public extension Camera2D {
    var target: Vector2 {
        get { Vector2(rlCamera.target) }
        set { rlCamera.target = newValue.rlVector }
    }

    var matrix: Matrix {
        GetCameraMatrix2D(rlCamera)
    }

    init(target: Vector2, offset: Vector2, zoom: Float, rotation: Float) {
        self.rlCamera = .init(
            offset: offset.rlVector,
            target: target.rlVector,
            rotation: rotation,
            zoom: zoom)
    }

    func action(_ perform: () -> Void) {
        BeginMode2D(rlCamera)
        perform()
        EndMode2D()
    }

    func worldToScreen(_ position: Vector2) -> Vector2 {
        Vector2(GetWorldToScreen2D(position.rlVector, rlCamera))
    }

    func screenToWorld(_ position: Vector2) -> Vector2 {
        Vector2(GetScreenToWorld2D(position.rlVector, rlCamera))
    }
}


// MARK: - Camera3D

public enum CameraType: Int32 {
    case perspective = 0
    case orthographic = 1
}

public struct Camera3D {
    internal var rlCamera: CRaylib.Camera

    init(_ rlCamera: CRaylib.Camera) {
        self.rlCamera = rlCamera
    }
}

public extension Camera3D {
    var target: Vector3 {
        get { Vector3(rlCamera.target) }
        set { rlCamera.target = newValue.rlVector }
    }

    var matrix: Matrix {
        GetCameraMatrix(rlCamera)
    }

    init(position: Vector3, target: Vector3, up: Vector3, fovy: Float, type: CameraType) {
        self.rlCamera = .init(
            position: position.rlVector,
            target: target.rlVector,
            up: up.rlVector,
            fovy: fovy,
            type: type.rawValue)
    }

    func action(_ perform: () -> Void) {
        BeginMode3D(rlCamera)
        perform()
        EndMode3D()
    }

    func rayFromMousePosition(_ mousePosition: Vector2) -> Ray {
        Ray(GetMouseRay(mousePosition.rlVector, rlCamera))
    }

    func worldToScreen(_ position: Vector3) -> Vector2 {
        Vector2(GetWorldToScreen(position.rlVector, rlCamera))
    }

    func worldToScreen(position: Vector3, size: Size) -> Vector2 {
        Vector2(GetWorldToScreenEx(position.rlVector, rlCamera, size.width32, size.height32))
    }
}
