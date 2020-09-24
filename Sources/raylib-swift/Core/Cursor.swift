//
//  Cursor.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public enum Cursor {
    public static var isHidden: Bool {
        get { IsCursorHidden() }
        set(willHide) { willHide ? HideCursor() : ShowCursor() }
    }

    public static func show() {
        ShowCursor()
    }

    public static func hide() {
        HideCursor()
    }

    public static func enable() {
        EnableCursor()
    }

    public static func disable() {
        DisableCursor()
    }
}
