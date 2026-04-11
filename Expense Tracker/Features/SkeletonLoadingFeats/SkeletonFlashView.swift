//
//  SkeletonFlashFeat.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct SkeletonFlashView: View {
    @State var isAnimating: Bool
    var size: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: value, style: .continuous)
            .fill(ButtonT.BColor.ColPrimary.valueBC)
            .frame(maxWidth: value , maxHeight: size * 1.2)
//            .rotationEffect(Angle(degrees: angle))
            .blur(radius: value * 2)
            .shadow(color: .gray, radius: 20)
            .offset(x: isAnimating ? -(size + size) : size + size)
            .onAppear {
                withAnimation(.linear(duration: xSeconds).repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
            }
            .ignoresSafeArea()
    }
    var angle: CGFloat {
        3.14 * 3.14
    }
    var xSeconds: Double {
        0.7
    }
    var value: CGFloat {
        angle/2 / xSeconds
    }
}

#Preview {
    SkeletonFlashView(isAnimating: true, size: 210)
}
