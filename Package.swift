// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// https://github.com/swiftlang/swift-package-manager/blob/main/Documentation/PackageDescription.md
let package = Package(
  name: "dark-coding-challenges",

  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(name: "easy", targets: ["easy"]),
    .library(name: "very_easy", targets: ["very_easy"]),
    .library(name: "very_hard", targets: ["very_hard"]),
    .library(name: "hard", targets: ["hard"]),
    .library(name: "medium", targets: ["medium"]),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-markdown.git", branch: "main"),
    .package(url: "https://github.com/Quick/Nimble.git", from: "13.0.0"),
    .package(url: "https://github.com/Kitura/BlueSocket.git", from: "2.0.0"),
    .package(url: "https://github.com/vapor/vapor.git", from: "4.113.2"),
    .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.4.3"),

    .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0"),
    .package(url: "https://github.com/swiftlang/swift-format.git", from: "600.0.0"),
    .package(url: "https://github.com/apple/example-package-figlet", branch: "main"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(name: "easy", dependencies: ["helpers", "BigInt"], path: "src/easy"),
    .target(name: "medium", path: "src/medium"),
    .target(name: "very_easy", dependencies: ["BigInt"], path: "src/very_easy"),
    .target(name: "very_hard", path: "src/very_hard"),
    .target(name: "helpers", path: "src/helpers"),
    .target(name: "hard", path: "src/hard"),
    .testTarget(name: "hardswift", dependencies: ["hard"], path: "test/hardswift"),
    .testTarget(name: "easyswift", dependencies: ["easy", "Nimble"], path: "test/easyswift"),
    .testTarget(name: "very_easy-swift", dependencies: ["very_easy"], path: "test/veryeasyswift"),
    .testTarget(name: "very_hard-swift", dependencies: ["very_hard"], path: "test/veryhardswift"),
    .testTarget(name: "mediumswift", dependencies: ["medium"], path: "test/mediumswift"),
  ])
