//
//  SkeletonFlashFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct SkeletonFlashFeat: View {
    @State var isAnimating: Bool
    var size: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: value, style: .continuous)
            .fill(.gray)
            .frame(maxWidth:
                   value , maxHeight: size * 1.2)
            .rotationEffect(Angle(degrees: angle))
            .blur(radius: value * 2)
            .offset(x: isAnimating ? -(size + size) : size + size)
            .onAppear {
                withAnimation(.linear(duration: xSeconds).repeatForever(autoreverses: false)) {
                    isAnimating = false
                }
            }
            .ignoresSafeArea()
    }
    var angle: CGFloat {
        .pi * .pi
    }
    var xSeconds: Double {
        0.7
    }
    var value: CGFloat {
        angle/2 * .pi
    }
}

#Preview {
    SkeletonFlashFeat(isAnimating: true, size: 210)
}
