//
//  EmptyStateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import SwiftUI

struct EmptyStateView: View {
    let reload: () -> Void
    
    var body: some View {
        let size = CardT.CHeight.smallH.cardCH
        
        VStack {
            Image(systemName: "questionmark.folder")
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
            Text("Unable to load data!")
                .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
        }
        .padding(24)
        PrimaryButton(
            buttonDisplay: "arrow.trianglehead.counterclockwise",
            infinite: false,
            alignLeft: false,
            action: reload
        )
        .onTapGesture {_ in
            Task { try? await Task.sleep(nanoseconds: 1_800_000_000) }
        }
    }
}

#Preview {
    EmptyStateView() {
        print("Reload button tapped in Preview")
    }
}
