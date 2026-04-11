//
//  NotesSubView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct NotesView: View {
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
                if notesValue?.isEmpty ?? true {
                    Text("Note  \(notesValue?.count ?? 0)/100")
                        .secondaryFontStyleExt(fontSize: FontT.primaryF.valueF)
                        .allowsHitTesting(false)
                        .padding(26)
                }
            }
            .onChange(of: notesValue) { _ , new in
                if let new, new.count > 100 {
                    notesValue = String(new.prefix(100))
                }
                
            }
        }
        .frame(maxWidth: CardT.CWidth.largeW.valueCW, maxHeight: CardT.CHeight.xLargeH.cardCH + 20)
    }
}

#Preview {
    NotesView(notesValue: .constant(""))
}
