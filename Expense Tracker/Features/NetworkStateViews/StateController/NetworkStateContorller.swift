//
//  NetworkStateContorller.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 11/04/26.
//

import SwiftUI

struct NetworkStateContorller: View{
    let state: NetworkStates
    
    var body: some View {
        switch state {
        case .empty(let reload):
            EmptyStateView(reload: reload )
        case .error(let error, let reload):
            ErrorStateView(error: error, reload: reload)
        case .loading:
            LoadingStateView()
        case .success(let result):
            SuccessStateView(result: result.conversionRate)
        }
    }
}


#Preview {
    NetworkStateContorller(state: .loading)
}

