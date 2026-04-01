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
            .scaleEffect(isTapped ? 1.2 : 1)
            .clipShape(.capsule)
            .animation(.smooth, value: isTapped)
    }
}

extension Image {
    func buttonIconStyleExt(buttonHeight: CGFloat, buttonWidth: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .fontWeight(.light)
            .foregroundStyle(Color.primary.opacity(0.8))
            .padding(ButtonT.buttonIcPad.valueBP)
            .frame(maxWidth: buttonWidth, maxHeight: buttonHeight)
    }
}
