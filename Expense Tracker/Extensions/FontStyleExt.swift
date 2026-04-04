//
//  GeneralFontExt.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct PrimaryFontStyleExt: ViewModifier {
    let fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.primary)
            .font(
                .system(size: fontSize, weight: .light, design: .monospaced)
            )
    }
}

extension View {
    func primaryFontStyleExt(fontSize: CGFloat) -> some View {
        modifier(PrimaryFontStyleExt(fontSize: fontSize))
    }
}

struct SecondaryFontStyleExt: ViewModifier {
    let fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .font(
                .system(size: fontSize, weight: .light, design: .monospaced)
            )
    }
}

extension View {
    func secondaryFontStyleExt(fontSize: CGFloat) -> some View {
        modifier(SecondaryFontStyleExt(fontSize: fontSize))
    }
}


struct AmountFontStyleExt: ViewModifier {
    let numSize: CGFloat
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.primary)
            .font(
                .system(size: numSize, weight: .bold, design: .default)
            )
            
    }
}

extension View {
    func amountFontStyleExt(numSize: CGFloat) -> some View {
        modifier(AmountFontStyleExt(numSize: numSize))
    }
}
