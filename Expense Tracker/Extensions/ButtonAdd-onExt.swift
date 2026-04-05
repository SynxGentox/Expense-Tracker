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
            .opacity(isTapped ? 0.8 : 1)
            .scaleEffect(isTapped ? 0.8 : 1)
            .clipShape(.capsule)
            .animation(.bouncy(extraBounce: 0.15), value: isTapped)
            
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
