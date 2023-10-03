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
					url: "https://core.indoorsnavi.pro/artifactory/ios/pro.indoorsnavi/indoorssdk/indoorssdk-3.5.8.zip",
					checksum: "8a8dee3216257280dcec4e63f2452f8a0a615313cc89e1ff2114bf4ea5b4ca03"
				)
	]
)

