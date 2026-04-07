//
//  CurrencyProtocolRepo.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 07/04/26.
//

import Foundation

protocol CurrencyProtocolRepo {
    func fetchRates() async throws -> CurrencyDataModel
}
