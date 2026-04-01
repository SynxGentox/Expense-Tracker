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

//struct ConcentricShape: View {
//    let cardWidth: CGFloat
//    let cardHeight: CGFloat
//    let color: Color
//    
//    var body: some View {
//        if #available(iOS 26.0, *) {
//            ConcentricRectangle(corners: .concentric(minimum: 15), isUniform: true)
//                .fill(color)
//                .frame(
//                    maxWidth: cardWidth,
//                    minHeight: cardHeight,
//                    maxHeight: cardHeight
//                )
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//}

#Preview {
    CardBackground(cornerRadius: 33, cardWidth: 200, cardHeight: 100, color: Color(UIColor.systemGray6))
}
