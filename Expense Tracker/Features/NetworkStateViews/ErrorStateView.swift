//
//  ErrorStateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import SwiftUI

struct ErrorStateView: View {
    let error: Error?
    let reload: () -> Void
    var body: some View {
        let size = CardT.CHeight.mediumH.cardCH
        VStack(spacing: 0) {
            ZStack {
                Image(systemName: "xmark.icloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: size, maxHeight: size)
                    .foregroundStyle(.orange)
                    .symbolRenderingMode(.multicolor)
                    .symbolEffect(.breathe)
                SkeletonFlashView(isAnimating: true, size: size)
                    .blendMode(.destinationOut)
            }
            Text("Error Connecting: \(String(describing: error))")
                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
                .padding(.bottom, 30)
            PrimaryButton(buttonDisplay: "arrow.trianglehead.counterclockwise", infinite: false, alignLeft: false, action: reload)
                .onTapGesture {_ in
                    Task { try? await Task.sleep(nanoseconds: 1_800_000_000) }
                }
            
        }
        .compositingGroup()
        
        
    }
}

#Preview {
    // Inject a trailing closure that just prints to the console
    ErrorStateView(error: URLError(.notConnectedToInternet)) {
        print("Reload button tapped in Preview")
    }
}
