// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "SwiftUILib-StackNavigation",
  platforms: [ .iOS(.v13), .macOS(.v10_15) ],
  products: [
    .library(
      name: "SwiftUILib.StackNavigation",
      targets: ["SwiftUILib_StackNavigation"]),
  ],
  targets: [
    .target(
      name: "SwiftUILib_StackNavigation",
      path: "src"),
    .testTarget(
      name: "SwiftUILib-StackNavigationTests",
      dependencies: ["SwiftUILib_StackNavigation"],
      path: "test"),
  ]
)
