//
//  PrimaryButtonStyle.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.accentColor.opacity(0.8))
            .interactiveButtonAddOn(isTapped: configuration.isPressed)
            
    }
}

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color(.secondarySystemBackground))
            .interactiveButtonAddOn(isTapped: configuration.isPressed)
    }
}
