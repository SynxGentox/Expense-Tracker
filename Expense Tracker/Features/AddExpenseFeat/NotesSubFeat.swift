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
    @Environment(\.colorScheme) var colScheme
    
    
    var body: some View {
        @Bindable var noteText = dataHelper
        ZStack(alignment: .topLeading) {
            TextEditor(text: Binding(
                get: { noteText.notesValue ?? "" },
                set: { noteText.notesValue = $0.isEmpty ? nil : $0 }
            ))
            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
            .scrollContentBackground(.hidden)
            .background(.clear)
            .frame(maxWidth: CardT.CWidth.largeW.valueCW, minHeight: CardT.CHeight.mediumH.cardCH)
            .padding(CardT.CRadNPad.IconPad.valueCR)
            .background(CardT.cardColCust(colScheme).valueCC)
            .clipShape(RoundedRectangle(cornerRadius: CardT.CRadNPad.radius.valueCR))
            .overlay(alignment: .topLeading) {
                if noteText.notesValue == nil || noteText.notesValue!.isEmpty {
                    Text("Description?")
                        .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        .allowsHitTesting(false)
                        .padding(25)
                }
            }
            
        }
    }
}

#Preview {
    NotesSubFeat()
        .environment(DataHelper())
}
