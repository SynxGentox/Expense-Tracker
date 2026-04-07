//
//  APIdataModel.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import Foundation

struct CurrencyDataModel: Codable {
    let result: String
    let documentation: String
    let termsOfUse: String
    let timeLastUpdateUtc: String
    let timeNextUpdateUtc: String
    let baseCode: String
    let conversionRate: [String : Double]
}
