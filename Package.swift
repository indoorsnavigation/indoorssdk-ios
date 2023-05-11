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
					url: "https://core.indoorsnavi.pro/artifactory/ios/pro.indoorsnavi/indoorssdk/indoorssdk-3.5.5.zip",
					checksum: "d573e3b87d7a89c8715acc06d0bd59a897d76eb0bf5d14d16990c0e45eaaa7a2"
				)
	]
)

