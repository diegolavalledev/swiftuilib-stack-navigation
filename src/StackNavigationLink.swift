import SwiftUI

/// A view that controls a navigation presentation.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct StackNavigationLink<Label, Destination> : View where Label : View, Destination : View {
  
  private var label: Label
  private var destination: Destination
  @State var isActive = false
  
  /// Creates an instance that presents `destination`.
  public init(destination: Destination, @ViewBuilder label: () -> Label) {
    self.label = label()
    self.destination = destination
  }
  
  /// Declares the content and behavior of this view.
  public var body: some View {
    get {
      Group {
        if isActive {
          label
        } else {
          label.onTapGesture {
            self.isActive.toggle()
          }
        }
      }
      .preference(
        key: StackNavigationPreferenceKey.self,
        value: [NavigationPage(isActive: $isActive, destination)]
      )
    }
  }
}

struct StackNavigationLink_Previews: PreviewProvider {
  static var previews: some View {
    StackNavigation {
      StackNavigationLink(destination: Text("Link Destination")) {
        Text("Navigation Link")
      }
    }
  }
}
