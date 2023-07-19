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
        
    ],
	targets: [
		.binaryTarget(
					name: "IndoorsSDK",
					url: "https://core.indoorsnavi.pro/artifactory/ios/pro.indoorsnavi/indoorssdk/indoorssdk-3.5.7.zip",
					checksum: "8757ebc280e4c3dbabfef974ce74283edc2ee03868365ec7f99bffd2a775dfb1"
				)
	]
)

