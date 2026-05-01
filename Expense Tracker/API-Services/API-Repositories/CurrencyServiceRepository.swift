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
        var lastError: Error?
        for _ in 0..<3 {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                return try JSONDecoder().decode(CurrencyModel.self, from: data)
            } catch {
                lastError = error
            }
        }
        throw lastError ?? URLError(.unknown)
    }
}
