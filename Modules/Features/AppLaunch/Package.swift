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
        .package(path: "../../Assembler"),
        .package(url: "https://github.com/mac-cain13/R.swift.git", exact: "7.4.0")
    ],
    targets: [
        .target(
            name: "AppLaunch",
            dependencies: [
                .product(name: "RswiftLibrary", package: "R.swift")
            ],
            resources: [.process("Resources/Localizable.strings")],
            plugins: [.plugin(name: "RswiftGeneratePublicResources", package: "R.swift")]
        )
    ]
)
