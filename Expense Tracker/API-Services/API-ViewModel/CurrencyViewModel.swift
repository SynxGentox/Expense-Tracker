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
                networkState = .loading
                if result.conversionRates.isEmpty {
                    networkState = .empty{
                        self.networkState = .empty {
                        }
                        print("empty")
                    }
                } else {
                    networkState = .success(rates: result)
                    print("success")
                }
            } catch {
                networkState = .error(error) {
                    self.networkState = .error(error) {
                        print(error)
                    }
                }
            }
        }
    }
        // Other code...
}
