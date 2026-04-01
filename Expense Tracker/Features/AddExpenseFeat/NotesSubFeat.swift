//
//  NotesSubView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct NotesSubFeat: View {
    @Environment(DataHelper.self) private var dataHelper
    @FocusState var isEditing: Bool
    
    
    var body: some View {
        @Bindable var noteText = dataHelper
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.largeH.cardCH,
                color: CardT.backCol.valueCC
            )
            VStack(alignment: .leading) {
                TextField("Description?", text: Binding(
                    get: {noteText.notesValue ?? ""},
                    set: {noteText.notesValue = $0.isEmpty ? nil : $0}))
                    .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                    
                Spacer()
            }
            .padding(CardT.CRadNPad.IconPad.valueCR)
        }
        .frame(maxWidth: CardT.CWidth.largeW.valueCW, maxHeight: CardT.CHeight.largeH.cardCH)
    }
}

#Preview {
    NotesSubFeat()
        .environment(DataHelper())
}
