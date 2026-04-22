//
//  APIdataModel.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import Foundation

struct CurrencyModel: Decodable {
    let result: String
    let documentation: String
    let termsOfUse: String
    let timeLastUpdateUtc: String
    let timeNextUpdateUtc: String
    let baseCode: String
    let conversionRates: [String : Double]
    
    enum CodingKeys: String, CodingKey {
        case result, documentation
        case termsOfUse = "terms_of_use"
        case timeLastUpdateUtc = "time_last_update_utc"
        case timeNextUpdateUtc = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}
