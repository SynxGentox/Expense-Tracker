//
//  NetStatesEnum.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 07/04/26.
//

import SwiftUI

/// Holds the network states and return the view for the state
enum NetworkStates {
    case loading
    case success(rates: CurrencyModel) // Pass the data here
    case error(Error, () -> Void)                  // Pass the error here
    case empty(() -> Void)
}
