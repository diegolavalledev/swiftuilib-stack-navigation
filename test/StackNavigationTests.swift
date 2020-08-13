import XCTest
import SwiftUI
import SwiftUILib_StackNavigation

final class StackNavigationTests: XCTestCase {

  func testStackNavigation() {
    _ = StackNavigation {
      EmptyView()
    }
  }

  func testNavigationLink() {
    _ = StackNavigation {
      StackNavigationLink(destination: EmptyView()) {
        EmptyView()
      }
    }
  }
}
