// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppLaunch",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AppLaunch",
            targets: ["AppLaunch"]
        )
    ],
    dependencies: [
        .package(path: "../../Assembler")
    ],
    targets: [
        .target(
            name: "AppLaunch",
            dependencies: ["Assembler"],
            resources: [.process("Resources/Localizable.strings")]
        )
    ]
)
