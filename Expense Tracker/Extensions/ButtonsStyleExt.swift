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
            .background(ButtonT.BColor.ColAccent.valueBC)
            .interactiveButtonAddOn(isTapped: configuration.isPressed)
            
    }
}

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(ButtonT.BColor.ColSysGray.valueBC)
            .interactiveButtonAddOn(isTapped: configuration.isPressed)
    }
}
