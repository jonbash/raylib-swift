//
//  Window.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import CRaylib


public class Window {
    private var _title: String

    public var configuration: WindowConfiguration {
        didSet {
            SetConfigFlags(configuration.rawValue)
        }
    }

    public init(
        size: Size,
        title: String,
        configuration: WindowConfiguration = [],
        icon: Image? = nil
    ) {
        self._title = title
        self.configuration = configuration

        title.withCString { InitWindow(size.width, size.height, $0) }
        if let icon = icon { self.setIcon(icon) }
    }
}

public extension Window {
    static var clipboard: String {
        get { String(cString: GetClipboardText()) }
        set { newValue.withCString(SetClipboardText(_:)) }
    }
    
    var title: String {
        get { _title }
        set {
            _title = newValue
            newValue.withCString(SetWindowTitle(_:))
        }
    }

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
    
    var position: Vector2 {
        get { Vector2(GetWindowPosition()) }
        set { SetWindowPosition(Int32(newValue.x), Int32(newValue.y)) }
    }
    var screenWidth: Int32 {
        GetScreenWidth()
    }
    var screenHeight: Int32 {
        GetScreenHeight()
    }
    var screenSize: Size {
        Size(width: GetScreenWidth(), height: GetScreenHeight())
    }

    func setMinimumSize(_ size: Size) {
        SetWindowMinSize(size.width, size.height)
    }

    func setMonitor(_ monitor: Monitor) {
        SetWindowMonitor(monitor.rawValue)
    }

    func setIcon(_ image: Image) {
        SetWindowIcon(image.rlImage)
    }

    func saveScreenshot(to filename: String) {
        filename.withCString(TakeScreenshot(_:))
    }

    func close() {
        CloseWindow()
    }
}

// MARK: - Time

public extension Window {
    var frameRate: Int { Int(GetFPS()) }
    var frameTime: Double { Double(GetFrameTime()) }
    var timeOpen: Double { GetTime() }

    func setTargetFPS(_ fps: Int) {
        SetTargetFPS(Int32(fps))
    }
}
