//
//  CategoryModel.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import Foundation

/// The Master Model for application categories
struct CategoryModel: Identifiable, Hashable {
    let id: UUID
    let title: String
    let systemIcon: String
    
    /// The Default Vault: Hardcoded options for new users
    static let categories: [CategoryModel] = [
        CategoryModel(id: UUID(), title: "Food & Drink", systemIcon: "fork.knife"),
        CategoryModel(id: UUID(), title: "Transportation", systemIcon: "car.fill"),
        CategoryModel(id: UUID(), title: "Shopping", systemIcon: "bag.fill"),
        CategoryModel(id: UUID(), title: "Subscriptions", systemIcon: "play.tv.fill"),
        CategoryModel(id: UUID(), title: "Utilities", systemIcon: "bolt.fill"),
        CategoryModel(id: UUID(), title: "Health", systemIcon: "cross.case.fill"),
        CategoryModel(id: UUID(), title: "Miscellaneous", systemIcon: "square.grid.2x2.fill")
    ]
}
