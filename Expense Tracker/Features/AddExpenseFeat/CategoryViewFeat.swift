//
//  CategoryView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 05/04/26.
//

import SwiftUI
import SwiftData

import SwiftUI

struct CategoryViewFeat: View {
    // 1. The State Transfer
    @Binding var selectedCategory: String
    @Binding var selectedIcon: String
    
    // 2. The Native Router
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        // 3. The Layout Engine (Native iOS Settings feel)
        List {
            ForEach(CategoryModel.categories) { category in
                Button {
                    // THE ACTION
                    selectedCategory = category.title
                    selectedIcon = category.systemIcon
                    
                    // The stateless hardware tap we discussed
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                    
                    dismiss()
                } label: {
                    // THE UI ROW
                    HStack(spacing: 16) {
                        // The Apple-style Icon Box
                        Image(systemName: category.systemIcon)
                            .font(.title3)
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        Text(category.title)
                            .font(.body)
                            .foregroundStyle(.primary)
                        
                        Spacer()
                        
                        // PRO-TOUCH: The Active Checkmark
                        if selectedCategory == category.title {
                            Image(systemName: "checkmark")
                                .font(.body.weight(.semibold))
                                .foregroundStyle(.accent)
                        }
                    }
                    .padding(.vertical, 4) // Gives the row a little breathing room
                }
                .tint(.primary) // Stops the whole row text from turning blue
            }
        }
        .navigationTitle("Select Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoryViewFeat(selectedCategory: .constant("ssd"), selectedIcon: .constant("bell"))
}
