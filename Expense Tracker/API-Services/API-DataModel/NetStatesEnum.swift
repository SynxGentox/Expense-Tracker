//
//  NetStatesEnum.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 07/04/26.
//

import SwiftUI

/// Holds the network states and return the view for the state
enum NetStatesEnum {
    case loading
    case success(rates: CurrencyDataModel) // Pass the data here
    case error(Error, () -> Void)                  // Pass the error here
    case empty
}
