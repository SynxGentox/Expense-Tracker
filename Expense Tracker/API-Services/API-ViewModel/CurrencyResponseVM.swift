//
//  API-.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 07/04/26.
//

import Foundation
import Observation

@Observable
@MainActor
class CurrencyResponseVM {
    var networkState: NetStatesEnum = .loading
    private let apiProtocol: CurrencyProtocolRepo
    
    init(apiProtocol: CurrencyProtocolRepo) {
        self.apiProtocol = apiProtocol
        fetchRates()
    }
    
    func fetchRates() {
        Task {
            do {
                let result = try await apiProtocol.fetchRates()
                if result.conversionRate.isEmpty {
                    networkState = .empty
                } else  {
                    networkState = .success(rates: result)
                }
            } catch {
                networkState = .error(error) { self.fetchRates() }
            }
        }
    }
        // Other code...
}
