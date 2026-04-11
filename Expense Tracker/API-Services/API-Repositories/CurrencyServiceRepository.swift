//
//  CurrencyService.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import Foundation

class CurrencyServiceRepository: CurrencyRepository {
    
    /// - Function: loadData(),  calls and fetches the data from the API, Data provided through JSON
    /// - Returns: the data from the api in through CurrencyDataModel format
    func fetchRates() async throws -> CurrencyModel {
        guard let url = URL(string: ExchangeRateUrl.exchangeUrl) else {
            throw URLError(.badURL)
        }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder  = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(CurrencyModel.self, from: data)
            return result
    }
}
