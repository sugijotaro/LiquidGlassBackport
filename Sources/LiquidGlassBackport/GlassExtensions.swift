//
//  GlassExtensions.swift
//  LiquidGlassBackport
//
//  Created by Jotaro Sugiyama on 2025/10/02.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func glassButtonStyleIfAvailable() -> some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            self.buttonStyle(.glass)
        } else {
            self
        }
    }

    @ViewBuilder
    func glassEffectIfAvailable(
        _ variant: Any? = nil
    ) -> some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            if let variant = variant as? Glass {
                self.glassEffect(variant)
            } else {
                self.glassEffect()
            }
        } else {
            self
        }
    }
}

public extension View {
    func glassEffectWithFallback() -> some View {
        self.modifier(GlassEffectFallback())
    }

    func glassEffectWithFallback<S: Shape>(shape: S) -> some View {
        self.modifier(GlassEffectFallback(shape: shape))
    }
}

struct _AnyShape: Shape {
    private let path: @Sendable (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        self.path = { rect in
            shape.path(in: rect)
        }
    }

    func path(in rect: CGRect) -> Path {
        path(rect)
    }
}

struct GlassEffectFallback: ViewModifier {
    let shape: _AnyShape?

    init() {
        self.shape = nil
    }

    init<S: Shape>(shape: S) {
        self.shape = _AnyShape(shape)
    }

    func body(content: Content) -> some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            if let shape {
                content.glassEffect(in: shape)
            } else {
                content.glassEffect()
            }
        } else {
            if let shape {
                content.background(.ultraThinMaterial, in: shape)
            } else {
                content.background(.ultraThinMaterial, in: Capsule())
            }
        }
    }
}
