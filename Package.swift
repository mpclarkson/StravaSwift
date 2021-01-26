// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StravaSwift",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "StravaSwift", targets: ["StravaSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.9.0"),
    ],
    targets: [
        .target(name: "StravaSwift", dependencies: ["Alamofire"]),
        .testTarget(name: "StravaSwiftTests", dependencies: ["StravaSwift"]),
    ]
)
