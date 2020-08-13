import SwiftUI

struct StackNavigationPreferenceKey: PreferenceKey {
  static var defaultValue: [NavigationPage] = []
  static func reduce(value: inout [NavigationPage], nextValue: () -> [NavigationPage]) {
    var nextPages = nextValue()
    if (nextPages.count > 0) {
      nextPages[nextPages.count - 1].id = value.count
      value += nextPages
    }
  }
}

struct StackNavigationPreferenceKey_Previews: PreviewProvider {
  static var previews: some View {
    Text("Stack Navigation")
    .preference(
      key: StackNavigationPreferenceKey.self,
      value: [NavigationPage(
        isActive: .constant(true), Text("Page")
      )]
    )
  }
}
