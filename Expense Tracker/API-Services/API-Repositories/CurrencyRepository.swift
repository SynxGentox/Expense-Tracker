//
//  CurrencyProtocolRepo.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 07/04/26.
//

import Foundation

protocol CurrencyRepository {
    func fetchRates() async throws -> CurrencyModel
}
