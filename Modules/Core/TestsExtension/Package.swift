// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestsExtension",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TestsExtension",
            targets: ["TestsExtension"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.1")
    ],
    targets: [
        .target(
            name: "TestsExtension",
            dependencies: [
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
