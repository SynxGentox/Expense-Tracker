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
            .fill(ButtonT.BColor.ColGrayStatic.valueBC.opacity(0.3))
            .frame(maxWidth: CardT.CWidth.mediumW.valueCW - 10,
                   maxHeight: size * 1.2)
//            .rotationEffect(Angle(degrees: angle))
            .blur(radius: value * 3)
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
        1.5
    }
    var value: CGFloat {
        angle / xSeconds
    }
}

#Preview {
    SkeletonFlashView(isAnimating: true, size: 210)
}
