import CRaylib
import Foundation


public class Window {
   var width: Int
   var height: Int
   var title: String
   var clearColor = Color(r: 0, g: 0, b: 0, a: 255)

   var shouldClose: Bool {
      get {
         WindowShouldClose()
      }
      set {
         CloseWindow()
      }
   }

   public init(width: Int, height: Int, title: String) {
      self.width = width
      self.height = height
      self.title = title

      InitWindow(Int32(width), Int32(height), title)
   }
}


public class Game {
   var window: Window
   var gameObjects: [GameObject] = []

   var fps: Int {
      get { Int(GetFPS()) }
      set { SetTargetFPS(Int32(newValue)) }
   }

   public init(window: Window) {
      self.window = window
   }

   func run() {
      DispatchQueue.global().async { [weak self] in
         while self?.window.shouldClose == false {
            guard let self = self else { return }

            self.update(deltaTime: GetFrameTime())
            
            DispatchQueue.main.async {
               self.draw()
            }
         }
      }
   }

   func update(deltaTime: Float) {
      gameObjects.forEach { go in
         go.update(deltaTime: deltaTime)
      }
   }

   func draw() {
      BeginDrawing()
      ClearBackground(window.clearColor)
      gameObjects.forEach { go in
         go.draw()
      }
      EndDrawing()
   }
}


protocol GameObject {
   func update(deltaTime: Float)
   func draw()
}
extension GameObject {
   func update(deltaTime: Float) {}
   func draw() {}
}


extension String {
   func draw(x: Int, y: Int, fontSize: Int, color: Color = Color(r: 255, g: 255, b: 255, a: 255)) {
      DrawText(self, Int32(x), Int32(y), Int32(fontSize), color)
   }
}
