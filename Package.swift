// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoopKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v13), .watchOS(.v4)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "LoopKit", targets: ["LoopKit"]),
        .library(name: "LoopKitUI", targets: ["LoopKitUI"]),
        .library(name: "MockKit", targets: ["MockKit"]),
        .library(name: "MockKitUI", targets: ["MockKitUI"]),
        .library(name: "LoopTestingKit", targets: ["LoopTestingKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/ps2/SwiftCharts.git", .branch("uikit-explicit"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LoopKit",
            dependencies: [],
            exclude: ["Info.plist"]
        ),
        .target(
            name: "LoopKitUI",
            dependencies: ["LoopKit", "SwiftCharts"],
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "LoopKitTests",
            dependencies: ["LoopKit"],
            exclude: ["Fixtures", "Info.plist"]
        ),
        .target(
            name: "MockKit",
            dependencies: ["LoopTestingKit", "LoopKit"],
            exclude: ["Info.plist"],
            resources: [
                .process("Assets")
            ]
        ),
        .target(
            name: "MockKitUI",
            dependencies: ["LoopKitUI", "LoopKit", "MockKit"],
            exclude: ["Info.plist"]
        ),
        .target(
            name: "LoopTestingKit",
            dependencies: ["LoopKit"],
            exclude: ["Info.plist"]
        ),
    ]
)