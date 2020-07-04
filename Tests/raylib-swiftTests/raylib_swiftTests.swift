import XCTest
@testable import raylib_swift

final class raylib_swiftTests: XCTestCase {
   func testExample() {
      let exp = XCTestExpectation(description: "blah")

      let window = Window(width: 800, height: 450, title: "Testy Gamey")
      let game = Game(window: window)
      game.gameObjects.append(TestObject(exp))
      game.run()

      wait(for: [exp], timeout: 20)
   }

   static var allTests = [
      ("testExample", testExample),
   ]
}

struct TestObject: GameObject {
   var time: Float = 0
   var expectation: XCTestExpectation?

   init(_ expectation: XCTestExpectation? = nil) {
      self.expectation = expectation
   }

   mutating func update(deltaTime: Float) {
      time += deltaTime
      if time > 10 {
         expectation?.fulfill()
      }
   }

   func draw() {
      "Congrats! You created your first window!".draw(x: 190, y: 200, fontSize: 20)
   }
}
