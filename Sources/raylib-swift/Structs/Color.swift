//
//  Color.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


private func toComponent(_ double: Double) -> UInt8 {
    UInt8(double * 255).clamped(to: 0...255)
}


public struct Color {
    internal var rlColor: CRaylib.Color

    internal init(_ rlColor: CRaylib.Color) {
        self.rlColor = rlColor
    }
}

public extension Color {
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        self.rlColor = .init(r: red, g: green, b: blue, a: alpha)
    }

    init(normalized: Vector4) {
        self.rlColor = ColorFromNormalized(normalized.rlVector)
    }

    init(hsv: Vector3) {
        self.rlColor = ColorFromHSV(hsv.rlVector)
    }

    init(hex: Int32) {
        self.rlColor = GetColor(hex)
    }

    var red: UInt8 { rlColor.r }
    var green: UInt8 { rlColor.g }
    var blue: UInt8 { rlColor.b }
    var alpha: UInt8 { rlColor.a }

    var hex: Int32 { ColorToInt(rlColor) }
    var normalized: Vector4 { Vector4(ColorNormalize(rlColor)) }
    var hsv: Vector3 { Vector3(ColorToHSV(rlColor)) }

    func fade(_ alpha: Float) -> Color {
        Color(Fade(rlColor, alpha))
    }
}

// MARK: - Constants

public extension Color {
    static let lightGray  = Color(red: 200, green: 200, blue: 200, alpha: 255)
    static let gray       = Color(red: 130, green: 130, blue: 130, alpha: 255)
    static let darkgray   = Color(red: 80, green: 80, blue: 80, alpha: 255)
    static let yellow     = Color(red: 253, green: 249, blue: 0, alpha: 255)
    static let gold       = Color(red: 255, green: 203, blue: 0, alpha: 255)
    static let orange     = Color(red: 255, green: 161, blue: 0, alpha: 255)
    static let pink       = Color(red: 255, green: 109, blue: 194, alpha: 255)
    static let red        = Color(red: 230, green: 41, blue: 55, alpha: 255)
    static let maroon     = Color(red: 190, green: 33, blue: 55, alpha: 255)
    static let green      = Color(red: 0, green: 228, blue: 48, alpha: 255)
    static let lime       = Color(red: 0, green: 158, blue: 47, alpha: 255)
    static let darkgreen  = Color(red: 0, green: 117, blue: 44, alpha: 255)
    static let skyblue    = Color(red: 102, green: 191, blue: 255, alpha: 255)
    static let blue       = Color(red: 0, green: 121, blue: 241, alpha: 255)
    static let darkblue   = Color(red: 0, green: 82, blue: 172, alpha: 255)
    static let purple     = Color(red: 200, green: 122, blue: 255, alpha: 255)
    static let violet     = Color(red: 135, green: 60, blue: 190, alpha: 255)
    static let darkpurple = Color(red: 112, green: 31, blue: 126, alpha: 255)
    static let beige      = Color(red: 211, green: 176, blue: 131, alpha: 255)
    static let brown      = Color(red: 127, green: 106, blue: 79, alpha: 255)
    static let darkbrown  = Color(red: 76, green: 63, blue: 47, alpha: 255)
    static let white      = Color(red: 255, green: 255, blue: 255, alpha: 255)
    static let black      = Color(red: 0, green: 0, blue: 0, alpha: 255)
    static let blank      = Color(red: 0, green: 0, blue: 0, alpha: 0)
    static let magenta    = Color(red: 255, green: 0, blue: 255, alpha: 255)
    static let raywhite   = Color(red: 245, green: 245, blue: 245, alpha: 255)
}
