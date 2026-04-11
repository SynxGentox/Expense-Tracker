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
            .scaleEffect(isTapped ? 0.8 : 1)
            .clipShape(.capsule)
            .animation(.bouncy, value: isTapped)
            
    }
}

extension Image {
    func buttonIconStyleExt(buttonHeight: CGFloat, buttonWidth: CGFloat, iconColor: Color, alignLeft: Bool) -> some View {
        self
            .resizable()
            .scaledToFit()
            .fontWeight(.light)
            .foregroundStyle(iconColor)
            .padding(ButtonT.buttonIcPad.valueBP)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignLeft ? .leading : .center)
            .frame(maxWidth: buttonWidth, maxHeight: buttonHeight)
            
            
    }
}
