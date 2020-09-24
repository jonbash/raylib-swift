//
//  Window.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public class Window {
    public var title: String {
        get { _title }
        set {
            _title = newValue
            newValue.withCString(SetWindowTitle(_:))
        }
    }

    private var _title: String

    public init(width: Int, height: Int, title: String, icon: Image? = nil) {
        self._title = title
        title.withCString { InitWindow(Int32(width), Int32(height), $0) }
    }
}

extension Window {
    var shouldClose: Bool { WindowShouldClose() }
    var isReady: Bool { IsWindowReady() }
    var isMinimized: Bool { IsWindowMinimized() }
    var isResized: Bool { IsWindowResized() }

    var isFullscreen: Bool {
        get { IsWindowFullscreen() }
        set {
            switch (isFullscreen, newValue) {
            case (true, false), (false, true):
                ToggleFullscreen()
            default:
                break
            }
        }
    }
    var isHidden: Bool {
        get { IsWindowHidden() }
        set(willHide) { willHide ? HideWindow() : UnhideWindow() }
    }

    func setIcon(_ image: Image) {
        SetWindowIcon(image.rlImage)
    }

    func close() {
        CloseWindow()
    }
}
