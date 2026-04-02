//
//  EssentialButtonAdd-ons.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

extension View {
    func interactiveButtonAddOn(isTapped: Bool) -> some View {
        self
            .foregroundStyle(.white)
            .opacity(isTapped ? 0.7 : 1)
            .scaleEffect(isTapped ? 1.4 : 1)
            .shadow(color: .black.opacity(0.25), radius: 2.5, x: 5, y: 5)
            .clipShape(.capsule)
            .animation(.smooth, value: isTapped)
            
    }
}

extension Image {
    func buttonIconStyleExt(buttonHeight: CGFloat, buttonWidth: CGFloat, iconColor: Color) -> some View {
        self
            .resizable()
            .scaledToFit()
            .fontWeight(.light)
            .foregroundStyle(iconColor)
            .padding(ButtonT.buttonIcPad.valueBP)
            .frame(maxWidth: buttonWidth, maxHeight: buttonHeight)
            
    }
}
