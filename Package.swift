// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Adfurikun-SPM-Maio",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AdfurikunMaio", targets: ["AdfurikunMaio"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Core.git",
            exact: "4.4.0"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Maio",
            url: "https://github.com/imobile/MaioSDK-v2-iOS/releases/download/v2.2.0/Maio.xcframework.zip",
            checksum: "75d70d45b58ab08019f1412a51f336aec20213eb490f04e8c5e9c312d5fa7917"
        ),
        .target(
            name: "AdfurikunMaio",
            dependencies: [
                .product(name: "AdfurikunSDK", package: "Adfurikun-SPM-Core"),
                "Maio"
            ],
            path: "Sources",
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedFramework("AdSupport"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Foundation"),
                .linkedFramework("Network"),
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
            ]
        )
    ]
)
