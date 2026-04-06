//
//  FilterNSortModel.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import Foundation
/// - Enum:  Holds the sorting cases
enum SortOptions: CaseIterable {
    case newestFirst
    case oldestFirst
    case highestAmount
    case lowestAmount
}
/// - Enum:  Holds the filtering cases
enum FilterOptions: Hashable {
    case all
    case specific(String)
    case withNotes           // filter by card, filter by user activity, filter by category, filter by customDate and customAmount will be added later
}
