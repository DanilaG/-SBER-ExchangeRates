// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Network",
            targets: ["Network"]
        )
    ],
    dependencies: [
        .package(path: "../Assembler"),
        .package(url: "https://github.com/CoreOffice/XMLCoder.git", exact: "0.17.1")
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: ["Assembler", "XMLCoder"]
        )
    ]
)
