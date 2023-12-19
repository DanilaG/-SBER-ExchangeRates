// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExchangeRates",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ExchangeRates",
            targets: ["ExchangeRates"]
        )
    ],
    dependencies: [
        .package(path: "../../Assembler"),
        .package(path: "../../Network")
    ],
    targets: [
        .target(
            name: "ExchangeRates",
            dependencies: [],
            resources: [.process("Resources/Localizable.strings")]
        )
    ]
)
