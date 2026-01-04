// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

// https://github.com/swiftlang/swift-package-manager/blob/main/Documentation/PackageDescription.md
let package = Package(
  name: "dark-coding-challenges",

  products: [
    .library(name: "easy", targets: ["easy"]),
    .library(name: "very_easy", targets: ["very_easy"]),
    .library(name: "very_hard", targets: ["very_hard"]),
    .library(name: "hard", targets: ["hard"]),
    .library(name: "medium", targets: ["medium"]),
    .library(name: "helpers", targets: ["helpers"]),
  ],

  dependencies: [
    .package(url: "https://github.com/apple/swift-numerics.git", from: "1.0.0"),
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
    .package(url: "https://github.com/vapor/console-kit.git", from: "4.7.0"),

  ],

  targets: [
    // Challenge targets
    .target(
      name: "easy",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics"),
        "helpers",
        "BigInt",
      ],
      path: "src/easy"
    ),

    .target(
      name: "very_easy",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics"),
        "helpers",
        "BigInt",
      ],
      path: "src/very_easy"
    ),

    .target(
      name: "very_hard",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics")
      ],
      path: "src/very_hard"
    ),

    .target(
      name: "medium",
      dependencies: ["easy"],
      path: "src/medium"
    ),
    .target(name: "hard", path: "src/hard"),
    .target(
      name: "helpers",
      dependencies: [
        .product(name: "ConsoleKit", package: "console-kit")
      ],
      path: "src/helpers"
    ),

    // Test targets
    .testTarget(
      name: "hardswift",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics"),
        "hard",
      ],
      path: "test/hardswift"
    ),

    .testTarget(
      name: "easyswift",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics"),
        "easy",
        "Nimble",
      ],
      path: "test/easyswift"
    ),

    .testTarget(
      name: "very_easy-swift",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics"),
        "very_easy",
      ],
      path: "test/veryeasyswift"
    ),

    .testTarget(
      name: "very_hard-swift",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics"),
        "very_hard",
      ],
      path: "test/veryhardswift"
    ),

    .testTarget(
      name: "mediumswift",
      dependencies: [
        .product(name: "Numerics", package: "swift-numerics"),
        "medium",
      ],
      path: "test/mediumswift"
    ),
  ]
)
