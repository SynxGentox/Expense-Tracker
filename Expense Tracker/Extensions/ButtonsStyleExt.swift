//
//  PrimaryButtonStyle.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var isSelected: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                configuration.isPressed || isSelected
                ? Color.white.opacity(0.6)
                : ButtonT.BColor.ColAccent.valueBC // Your default color
            )
            .clipShape(.capsule)
        // 2. The Spatial Brightness Bump
            .brightness(configuration.isPressed ? 0.20 : 0.0)
        // 3. The Neon Glow (Shadow)
            .shadow(
                color: .white.opacity(0.8),
                radius: configuration.isPressed ? 20 : 0
            )
            .scaleEffect(configuration.isPressed || isSelected ? 1.1 : 0.9)
        // Smoothly animate the transition between states
            .animation(.bouncy(extraBounce: 0.4), value: configuration.isPressed || isSelected)
            
    }
}

struct ActionButtonStyle: ButtonStyle {
    var isSelected: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                configuration.isPressed || isSelected
                ? Color.white.opacity(0.7)
                : ButtonT.BColor.ColSysBack.valueBC // Your default color
            )
            .shadow(
                color: .white.opacity(0.8),
                radius: configuration.isPressed ? 20 : 0
            )
            .clipShape(.capsule)
        // 2. The Spatial Brightness Bump
            .brightness(configuration.isPressed ? 0.3 : 0.0)
        // 3. The Neon Glow (Shadow)
            
            .scaleEffect(configuration.isPressed || isSelected ? 1 : 0.8)
        // Smoothly animate the transition between states
            .animation(.bouncy(extraBounce: 0.4), value: configuration.isPressed || isSelected)
    }
}
