// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IndoorsSDK",
    products: [
        
        .library(
            name: "IndoorsSDK",
            targets: ["IndoorsSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/maplibre/maplibre-gl-native-distribution", .exactItem("5.13.0"))
    ],
	targets: [
		.binaryTarget(
					name: "IndoorsSDK",
					url: "https://core.indoorsnavi.pro/artifactory/ios/pro.indoorsnavi/indoorssdk/indoorssdk-3.5.9.zip",
					checksum: "551e8def39c26534087e8158cf2b1838a582f44c841419f2e2d58651f08520fb"
				)
	]
)

