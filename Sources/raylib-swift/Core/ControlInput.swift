//
//  Input.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public protocol ControlInput {
    var isPressed: Bool { get }
    var isDown: Bool { get }
    var isReleased: Bool { get }
    var isUp: Bool { get }
}


// MARK: - Key

public enum Key: Int32 {
    // Alphanumeric
    case apostrophe      = 39
    case comma           = 44
    case minus           = 45
    case period          = 46
    case slash           = 47
    case zero            = 48
    case one             = 49
    case two             = 50
    case three           = 51
    case four            = 52
    case five            = 53
    case six             = 54
    case seven           = 55
    case eight           = 56
    case nine            = 57
    case semicolon       = 59
    case equal           = 61
    case a               = 65
    case b               = 66
    case c               = 67
    case d               = 68
    case e               = 69
    case f               = 70
    case g               = 71
    case h               = 72
    case i               = 73
    case j               = 74
    case k               = 75
    case l               = 76
    case m               = 77
    case n               = 78
    case o               = 79
    case p               = 80
    case q               = 81
    case r               = 82
    case s               = 83
    case t               = 84
    case u               = 85
    case v               = 86
    case w               = 87
    case x               = 88
    case y               = 89
    case z               = 90

    // function
    case space           = 32
    case escape          = 256
    case enter           = 257
    case tab             = 258
    case backspace       = 259
    case insert          = 260
    case delete          = 261
    case right           = 262
    case left            = 263
    case down            = 264
    case up              = 265
    case page_up         = 266
    case page_down       = 267
    case home            = 268
    case end             = 269
    case caps_lock       = 280
    case scroll_lock     = 281
    case num_lock        = 282
    case print_screen    = 283
    case pause           = 284
    case f1              = 290
    case f2              = 291
    case f3              = 292
    case f4              = 293
    case f5              = 294
    case f6              = 295
    case f7              = 296
    case f8              = 297
    case f9              = 298
    case f10             = 299
    case f11             = 300
    case f12             = 301
    case left_shift      = 340
    case left_control    = 341
    case left_alt        = 342
    case left_super      = 343
    case right_shift     = 344
    case right_control   = 345
    case right_alt       = 346
    case right_super     = 347
    case kb_menu         = 348
    case left_bracket    = 91
    case backslash       = 92
    case right_bracket   = 93
    case grave           = 96

    // keypad
    case kp_0            = 320
    case kp_1            = 321
    case kp_2            = 322
    case kp_3            = 323
    case kp_4            = 324
    case kp_5            = 325
    case kp_6            = 326
    case kp_7            = 327
    case kp_8            = 328
    case kp_9            = 329
    case kp_decimal      = 330
    case kp_divide       = 331
    case kp_multiply     = 332
    case kp_subtract     = 333
    case kp_add          = 334
    case kp_enter        = 335
    case kp_equal        = 336
}

extension Key: ControlInput {
    public var isPressed: Bool { IsKeyPressed(rawValue) }
    public var isDown: Bool { IsKeyDown(rawValue) }
    public var isReleased: Bool { IsKeyReleased(rawValue) }
    public var isUp: Bool { IsKeyUp(rawValue) }
}

public extension Key {
    static var exit: Key = .escape {
        didSet { SetExitKey(exit.rawValue) }
    }

    static func lastPressed() -> Key? {
        Key(rawValue: GetKeyPressed())
    }
}


// MARK: - Mouse

public enum Mouse {}

public extension Mouse {
    static var x: Int32 {
        get { GetMouseX() }
        set { SetMousePosition(newValue, y) }
    }
    static var y: Int32 {
        get { GetMouseY() }
        set { SetMousePosition(x, newValue) }
    }
    static var position: Vector2 {
        get { Vector2(GetMousePosition()) }
        set { SetMousePosition(Int32(newValue.x), Int32(newValue.y)) }
    }
    static var wheelMovement: Int32 { GetMouseWheelMove() }

    static func setOffset(_ offset: Vector2) {
        SetMouseOffset(Int32(offset.x), Int32(offset.y))
    }
    static func setScale(_ scale: Vector2) {
        SetMouseScale(scale.x, scale.y)
    }
}


public enum MouseButton: Int32 {
    case left = 0
    case right = 1
    case middle = 2
}

extension MouseButton: ControlInput {
    public var isPressed: Bool { IsMouseButtonPressed(rawValue) }
    public var isDown: Bool { IsMouseButtonDown(rawValue) }
    public var isReleased: Bool { IsMouseButtonReleased(rawValue) }
    public var isUp: Bool { IsMouseButtonUp(rawValue) }
}


// MARK: - Gamepad

public enum Gamepad: Int32 {
    case player1 = 0
    case player2 = 1
    case player3 = 2
    case player4 = 3
}

public extension Gamepad {
    var isAvailable: Bool { IsGamepadAvailable(rawValue) }
    var name: String { String(cString: GetGamepadName(rawValue)) }
    var axes: Int32 { GetGamepadAxisCount(rawValue) }

    func movement(forAxis axis: GamepadAxis) {
        GetGamepadAxisMovement(rawValue, axis.rawValue)
    }

    func button(_ button: GamepadButton) -> Button {
        Button(gamepad: self, button: button)
    }
}


public enum GamepadButton: Int32 {
    // This is here just for error checking
    case unknown = 0

    // dpad
    case leftFaceUp
    case leftFaceRight
    case leftFaceDown
    case leftFaceLeft
    // xbox - [y,x,a,b]
    // ps - [tri,sqr,x,o]
    case rightFaceUp
    case rightFaceRight
    case rightFaceDown
    case rightFaceLeft

    case leftTrigger1
    case leftTrigger2
    case rightTrigger1
    case rightTrigger2

    case middleLeft // ps3 select
    case middle // ps/xbox button
    case middleRight // ps3 start

    case leftThumb // l3
    case rightThumb // r3

    public static var lastButtonPressed: GamepadButton? {
        GamepadButton(rawValue: GetGamepadButtonPressed())
    }
}

public extension GamepadButton {
    func isPressed(on gamepad: Gamepad) -> Bool {
        IsGamepadButtonPressed(gamepad.rawValue, rawValue)
    }

    func isDown(on gamepad: Gamepad) -> Bool {
        IsGamepadButtonDown(gamepad.rawValue, rawValue)
    }

    func isReleased(on gamepad: Gamepad) -> Bool {
        IsGamepadButtonReleased(gamepad.rawValue, rawValue)
    }

    func isUp(on gamepad: Gamepad) -> Bool {
        IsGamepadButtonUp(gamepad.rawValue, rawValue)
    }
}


public enum GamepadAxis: Int32 {
    case leftX = 0
    case leftY

    case rightX
    case rightY

    // pressure levels [1...-1]
    case leftTrigger
    case rightTrigger
}


public struct Button: ControlInput {
    public let gamepad: Gamepad
    public let button: GamepadButton

    public var isPressed: Bool { button.isPressed(on: gamepad) }
    public var isDown: Bool { button.isDown(on: gamepad) }
    public var isReleased: Bool { button.isReleased(on: gamepad) }
    public var isUp: Bool { button.isUp(on: gamepad) }
}


// MARK: - Touch

public enum Touch {}

public extension Touch {
    static var x: Int32 { GetTouchX() }
    static var y: Int32 { GetTouchY() }

    static var count: Int32 { GetTouchPointsCount() }

    static func position(of touchIndex: Int32) -> Vector2 {
        Vector2(GetTouchPosition(touchIndex))
    }
}


public struct Gestures: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
}

public extension Gestures {
    static let tap         = Gestures(rawValue: 1)
    static let doubleTap   = Gestures(rawValue: 2)
    static let hold        = Gestures(rawValue: 4)
    static let drag        = Gestures(rawValue: 8)
    static let swipeRight  = Gestures(rawValue: 16)
    static let swipeLeft   = Gestures(rawValue: 32)
    static let swipeUp     = Gestures(rawValue: 64)
    static let swipeDown   = Gestures(rawValue: 128)
    static let pinchIn     = Gestures(rawValue: 256)
    static let pinchOut    = Gestures(rawValue: 512)

    static var lastDetected: Gestures {
        Gestures(rawValue: UInt32(GetGestureDetected()))
    }
}

public extension Gestures {
    var isDetected: Bool { IsGestureDetected(Int32(rawValue)) }

    func enable() {
        SetGesturesEnabled(rawValue)
    }
}
