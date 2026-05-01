//
//  CategoryView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 05/04/26.
//

import SwiftUI
import SwiftData

import SwiftUI

struct CategoryListView: View {
    // 1. The State Transfer
    @Binding var selectedCategory: String
    @Binding var selectedIcon: String
    
    // 2. The Native Router
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ForEach(CategoryModel.categories) { category in
                Button {
                    selectedCategory = category.title
                    selectedIcon = category.systemIcon
                    
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                    
                    dismiss()
                } label: {
                    HStack(spacing: 16) {
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
                        
                        if selectedCategory == category.title {
                            Image(systemName: "checkmark")
                                .font(.body.weight(.semibold))
                                .foregroundStyle(.accent)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .tint(.primary)
            }
        }
        .navigationTitle("Select Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoryListView(selectedCategory: .constant("ssd"), selectedIcon: .constant("bell"))
}
