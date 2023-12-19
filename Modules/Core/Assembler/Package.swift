// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Assembler",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Assembler",
            targets: ["Assembler"]
        )
    ],
    targets: [
        .target(
            name: "Assembler",
            dependencies: []
        )
    ]
)
