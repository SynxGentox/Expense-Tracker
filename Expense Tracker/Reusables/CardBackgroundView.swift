//
//  CardBackground.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct CardBackground: View {
    let cornerRadius: CGFloat
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(color)
            .frame(
                maxWidth: cardWidth,
                minHeight: cardHeight,
                maxHeight: cardHeight
            )
    }
}

#Preview {
    CardBackground(cornerRadius: 33, cardWidth: 200, cardHeight: 100, color: Color(UIColor.systemGray6))
}
