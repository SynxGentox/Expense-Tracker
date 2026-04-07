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
    var currency: CurrencyDataModel? = nil
    var errorMsg: String?
    var isLoading: Bool = true
    var networkState = NetStatesEnum.isLoading
    private let apiProtocol: CurrencyProtocolRepo
    
    init(apiProtocol: CurrencyProtocolRepo) {
        self.apiProtocol = apiProtocol
        fetchRates()
    }
    
    func fetchRates() {
        isLoading = true
        Task {
            do {
                currency = try await apiProtocol.fetchRates()
                networkState = .isSuccess
            } catch {
                errorMsg = error.localizedDescription
                networkState = .isError
            }
            isLoading = false
        }
    }
        // Other code...
}
