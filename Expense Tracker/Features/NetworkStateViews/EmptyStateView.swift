//
//  EmptyStateView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 08/04/26.
//

import SwiftUI

struct EmptyStateView: View {
    let size = CardT.CHeight.smallH.cardCH
    var body: some View {
        Image(systemName: "questionmark.folder")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
        Text("Unable to load data!")
            .secondaryFontStyleExt(fontSize: FontT.secondaryF.valueF)
    }
}

#Preview {
    EmptyStateView()
}
