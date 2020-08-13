import SwiftUI

/// A type-erased `View`.
///
/// An `AnyView` allows changing the type of view used in a given view
/// hierarchy. Whenever the type of view used with an `AnyView`
/// changes, the old hierarchy is destroyed and a new hierarchy is
/// created for the new type.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct NavigationPage : View, Equatable, Identifiable {

  static func == (lhs: NavigationPage, rhs: NavigationPage) -> Bool {
    lhs.id == rhs.id && lhs.isActive == rhs.isActive
  }

  var id: Int? = nil
  @Binding var isActive: Bool
  private var content: AnyView
  
  /// Create an instance that type-erases `view`.
  public init<V>(isActive: Binding<Bool>, _ view: V) where V : View {
    _isActive = isActive
    content = AnyView(view)
  }
  
  public var body: some View {
    content.id(id)
  }
}

struct NavigationPage_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationPage(isActive: .constant(true), Text("Active page"))
      .previewDisplayName("Active")
      NavigationPage(isActive: .constant(false), Text("Inactive page"))
      .previewDisplayName("Inactive")
    }
  }
}
