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
class CurrencyViewModel {
    var networkState: NetworkStates = .loading
    private let apiProtocol: CurrencyRepository
    
    init(apiProtocol: CurrencyRepository) {
        self.apiProtocol = apiProtocol
        fetchRates()
    }
    
    func fetchRates() {
        Task {
            do {
                let result = try await apiProtocol.fetchRates()
                if result.conversionRates.isEmpty {
                    networkState = .empty{
                        self.networkState = .empty {
                        }
                    }
                } else {
                    networkState = .success(rates: result)
                }
            } catch {
                networkState = .error(error) {
                    self.networkState = .error(error) {
                    }
                }
            }
        }
    }
}
