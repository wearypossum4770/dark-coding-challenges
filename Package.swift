// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// https://github.com/swiftlang/swift-package-manager/blob/main/Documentation/PackageDescription.md
let package = Package(
  name: "dark-coding-challenges",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "easy",
      targets: ["easy"]
    ),

    .library(
      name: "medium",
      targets: ["medium"]
    ),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "easy",
      dependencies: ["helpers"],
      path: "src/easy"
    ),
    .target(
      name: "medium",
      path: "src/medium"
    ),
    .target(
      name: "helpers",
      path: "src/helpers"
    ),
    .testTarget(
      name: "easyswift",
      dependencies: ["easy"],
      path: "test/easyswift"
    ),
    .testTarget(
      name: "mediumswift",
      dependencies: ["medium"],
      path: "test/mediumswift"
    ),
  ]
)
