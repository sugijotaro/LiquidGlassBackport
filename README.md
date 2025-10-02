# LiquidGlassBackport

[日本語Readmeはこちら](README.ja.md)

A Swift package to backport the `glass` effect and `glass` button style from iOS 26 to older versions like iOS 17.

## Features

This library provides several SwiftUI `View` extensions to apply glass-like effects with fallback options for older operating systems.

-   `glassButtonStyle()`: Applies the `.glass` button style on supported OS versions, with a `.thinMaterial` background as a fallback.
-   `glassButtonStyleIfAvailable()`: Applies the `.glass` button style only on supported OS versions, with no effect on older versions.
-   `glassButtonStyleWithBorderedFallback()`: Applies the `.glass` button style on supported OS versions, with a `.bordered` button style as a fallback.
-   `glassEffectWithFallback()`: Applies the `.glassEffect` on supported OS versions, with a `.thinMaterial` background as a fallback. It also supports custom shapes.
-   `glassEffectIfAvailable()`: Applies the `.glassEffect` only on supported OS versions, with no effect on older versions.

## Requirements

-   iOS 17.0+
-   macOS 12.0+

## Installation

You can add LiquidGlassBackport to your project using Swift Package Manager.

In Xcode, select `File` > `Add Packages...` and enter the repository URL:

```
https://github.com/your_username/LiquidGlassBackport.git
```

## Usage

Here's how you can use the view modifiers provided by this package.

First, import `LiquidGlassBackport` in your SwiftUI view file:
```swift
import LiquidGlassBackport
```

### Glass Button Style

```swift
Button("Glass Button") {
    // Action
}
.glassButtonStyle()
```

### Glass Effect with Fallback

You can apply the glass effect to any view.

**Default Shape (Capsule)**
```swift
Text("Hello, World!")
    .padding()
    .glassEffectWithFallback()
```

**Custom Shape (RoundedRectangle)**
```swift
Text("Hello, World!")
    .padding()
    .glassEffectWithFallback(shape: RoundedRectangle(cornerRadius: 20))
```

**Custom Shape (Circle)**
```swift
Image(systemName: "star.fill")
    .padding(30)
    .glassEffectWithFallback(shape: Circle())
```
