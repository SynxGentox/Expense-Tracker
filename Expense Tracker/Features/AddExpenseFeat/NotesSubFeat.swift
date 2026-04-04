//
//  NotesSubView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct NotesSubFeat: View {
    @Binding var notesValue: String?
    @FocusState var isEditing: Bool
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: Binding(
                get: { notesValue ?? "" },
                set: { notesValue = $0.isEmpty ? nil : $0 }
            ))
            .primaryFontStyleExt(fontSize: FontT.primaryF.valueF)
            .scrollContentBackground(.hidden)
            .background(.clear)
            .frame(maxWidth: CardT.CWidth.largeW.valueCW, minHeight: CardT.CHeight.mediumH.cardCH)
            .padding(CardT.CRadNPad.IconPad.valueCR)
            .background(CardT.cardColGray.valueCC)
            .clipShape(RoundedRectangle(cornerRadius: CardT.CRadNPad.radius.valueCR))
            .overlay(alignment: .topLeading) {
                if notesValue == nil || notesValue!.isEmpty {
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
    NotesSubFeat(notesValue: .constant(""))
}
