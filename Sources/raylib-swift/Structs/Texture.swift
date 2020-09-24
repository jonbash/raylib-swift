//
//  Texture.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib

public enum PixelFormat: Int32 {
    case uncompressed_grayscale = 1
    case uncompressed_gray_alpha
    case uncompressed_r5g6b5
    case uncompressed_r8g8b8
    case uncompressed_r5g5b5a1
    case uncompressed_r4g4b4a4
    case uncompressed_r8g8b8a8
    case uncompressed_r32
    case uncompressed_r32g32b32
    case uncompressed_r32g32b32a32
    case compressed_dxt1_rgb
    case compressed_dxt1_rgba
    case compressed_dxt3_rgba
    case compressed_dxt5_rgba
    case compressed_etc1_rgb
    case compressed_etc2_rgb
    case compressed_etc2_eac_rgba
    case compressed_pvrt_rgb
    case compressed_pvrt_rgba
    case compressed_astc_4x4_rgba
    case compressed_astc_8x8_rgba
}


// MARK: - Texture

public struct Texture {
    internal var rlTexture: CRaylib.Texture

    internal init(_ rlTexture: CRaylib.Texture) {
        self.rlTexture = rlTexture
    }
}

public extension Texture {
    init(id: UInt32, size: Size, format: PixelFormat, mipmaps: Int32 = 1) {
        rlTexture = .init(
            id: id,
            width: size.width32,
            height: size.height32,
            mipmaps: mipmaps,
            format: format.rawValue)
    }

    init(filename: String) {
        rlTexture = filename.withCString(LoadTexture(_:))
    }

    init(image: Image) {
        rlTexture = LoadTextureFromImage(image.rlImage)
    }
}


// MARK: - Render Texture 2D

public struct RenderTexture2D {
    internal var rlRenderTexture: CRaylib.RenderTexture2D

    internal init(_ rlRenderTexture: CRaylib.RenderTexture2D) {
        self.rlRenderTexture = rlRenderTexture
    }
}

public extension RenderTexture2D {
    init(size: Size) {
        self.rlRenderTexture = LoadRenderTexture(size.width32, size.height32)
    }

    func draw(_ drawing: () -> Void) {
        BeginTextureMode(rlRenderTexture)
        drawing()
        EndTextureMode()
    }
}
