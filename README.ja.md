# LiquidGlassBackport

iOS 26からの`glass`エフェクトと`glass`ボタンスタイルを、iOS 17のような古いバージョンにバックポートするためのSwiftパッケージです。

## 特徴

このライブラリは、古いオペレーティングシステム向けのフォールバックオプションを備えた、ガラスのようなエフェクトを適用するためのいくつかのSwiftUI `View`拡張機能を提供します。

-   `glassButtonStyle()`: サポートされているOSバージョンでは`.glass`ボタンスタイルを適用し、フォールバックとして`.thinMaterial`の背景を使用します。
-   `glassButtonStyleIfAvailable()`: サポートされているOSバージョンでのみ`.glass`ボタンスタイルを適用し、古いバージョンでは効果がありません。
-   `glassButtonStyleWithBorderedFallback()`: サポートされているOSバージョンでは`.glass`ボタンスタイルを適用し、フォールバックとして`.bordered`ボタンスタイルを使用します。
-   `glassEffectWithFallback()`: サポートされているOSバージョンでは`.glassEffect`を適用し、フォールバックとして`.thinMaterial`の背景を使用します。カスタムシェイプもサポートしています。
-   `glassEffectIfAvailable()`: サポートされているOSバージョンでのみ`.glassEffect`を適用し、古いバージョンでは効果がありません。

## 要件

-   iOS 17.0+
-   macOS 12.0+

## インストール

Swift Package Managerを使用して、LiquidGlassBackportをプロジェクトに追加できます。

Xcodeで、`File` > `Add Packages...`を選択し、リポジトリのURLを入力します：

```
https://github.com/your_username/LiquidGlassBackport.git
```

## 使い方

このパッケージが提供するビューモディファイアの使用方法は次のとおりです。

まず、SwiftUIのビューファイルで`LiquidGlassBackport`をインポートします：
```swift
import LiquidGlassBackport
```

### Glassボタンスタイル

```swift
Button("Glass Button") {
    // Action
}
.glassButtonStyle()
```

### Glassエフェクト（フォールバック付き）

任意のビューにガラスエフェクトを適用できます。

**デフォルトの形状（カプセル）**
```swift
Text("Hello, World!")
    .padding()
    .glassEffectWithFallback()
```

**カスタム形状（角丸長方形）**
```swift
Text("Hello, World!")
    .padding()
    .glassEffectWithFallback(shape: RoundedRectangle(cornerRadius: 20))
```

**カスタム形状（円）**
```swift
Image(systemName: "star.fill")
    .padding(30)
    .glassEffectWithFallback(shape: Circle())
```
