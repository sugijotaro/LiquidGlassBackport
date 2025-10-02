//
//  ContentView.swift
//  LiquidGlassBackportDemoApp
//
//  Created by Jotaro Sugiyama on 2025/10/02.
//

import SwiftUI
import LiquidGlassBackport

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Glass Extensions Demo")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // 1. glassButtonStyleIfAvailable
                Button(action: {
                    print("Glass Button Tapped")
                }) {
                    Label("Glass Button", systemImage: "button.programmable")
                        .padding()
                }
                .glassButtonStyleIfAvailable()

                // 2. glassEffectWithFallback (default shape)
                Text("Default Shape (Capsule)")
                    .padding()
                    .glassEffectWithFallback()

                // 3. glassEffectWithFallback (custom shape: RoundedRectangle)
                Text("RoundedRectangle Shape")
                    .padding()
                    .glassEffectWithFallback(shape: RoundedRectangle(cornerRadius: 20))

                // 4. glassEffectWithFallback (custom shape: Circle)
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .padding(30)
                    .glassEffectWithFallback(shape: Circle())

                // 5. Original glassEffectIfAvailable
                Text("Original glassEffectIfAvailable")
                    .padding()
                    .glassEffectIfAvailable()
            }
            .padding()
        }
        .background {
            Image("Wallpaper")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
