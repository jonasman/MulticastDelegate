// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "MulticastDelegate",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .watchOS(.v2), .tvOS(.v9)
    ],
    products: [
        .library(name: "MulticastDelegate", targets: ["MulticastDelegate"])
    ],
    targets: [
        .target(name: "MulticastDelegate")
    ]
)
