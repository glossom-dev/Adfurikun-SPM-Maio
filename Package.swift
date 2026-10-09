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
            exact: "4.5.0-alpha.3"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Maio",
            url: "https://github.com/imobile/MaioSDK-v2-iOS/releases/download/v2.2.2/Maio.xcframework.zip",
            checksum: "ee79658e8302ff211ba5f1c1896ac145d8c793bae58bcf7cb0ed63ee2e53167b"
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
