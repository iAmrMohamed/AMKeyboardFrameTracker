// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AMKeyboardFrameTracker",
    platforms: [.iOS(.v10)],
    products: [.library(
            name: "AMKeyboardFrameTracker",
            targets: ["AMKeyboardFrameTracker"])],
    targets: [.target(
            name: "AMKeyboardFrameTracker",
            path: "AMKeyboardFrameTracker/Classes")]
)
