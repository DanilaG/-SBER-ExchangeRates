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
        .package(path: "../../Network"),
        .package(path: "../../TestsExtension"),
        .package(url: "https://github.com/Quick/Nimble.git", exact: "12.3.0"),
        .package(url: "https://github.com/MakeAWishFoundation/SwiftyMocky", exact: "4.2.0"),
        .package(url: "https://github.com/mac-cain13/R.swift.git", exact: "7.4.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.1")
    ],
    targets: [
        .target(
            name: "ExchangeRates",
            dependencies: [
                "Assembler",
                "Network",
                .product(name: "RswiftLibrary", package: "R.swift")
            ],
            resources: [.process("Resources/Localizable.strings")],
            plugins: [.plugin(name: "RswiftGeneratePublicResources", package: "R.swift")]
        ),
        .testTarget(
            name: "ExchangeRatesTests",
            dependencies: [
                "ExchangeRates",
                "SwiftyMocky",
                "Nimble",
                "TestsExtension",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            resources: [.process("Data")],
            plugins: [.plugin(name: "RswiftGeneratePublicResources", package: "R.swift")]
        )
    ]
)
