import SwiftUI

/// A view for presenting a stack of views representing a visible path in a
/// navigation hierarchy.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct StackNavigation<Content> : View where Content : View {
  
  private var content: Content
  @State private var stack: [NavigationPage] = []
  
  public init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  public var body: some View {
    ZStack {
      content
      ForEach(stack) { page in
        VStack(spacing: 0) {
          HStack {
            Button("< Back") {
              if let last = self.stack.last {
                last.$isActive.wrappedValue.toggle()
                //last.isActive.toggle()
              }
            }
            Spacer()
            Text("Title")
            Spacer()
            Button("X") {
            }
          }
          .padding()
          //.background(Color.white)
          Color.black.overlay(page)
        }
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .slide))
        .animation(.easeIn)
      }
    }
    .onPreferenceChange(StackNavigationPreferenceKey.self) {
      self.stack = $0.filter { $0.isActive }
    }
  }
}

struct StackNavigation_Previews: PreviewProvider {
  static var previews: some View {
    StackNavigation {
      Text("Hello Stack Navigation")
    }
  }
}
