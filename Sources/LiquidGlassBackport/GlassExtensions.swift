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
