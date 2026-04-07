//
//  NetStatesEnum.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 07/04/26.
//

import SwiftUI

enum NetStatesEnum {
    case isLoading
    case isError
    case isSuccess
    
    var state: any View {
        switch self {
        case .isError:      return  Text("SomethingWentWrong")
        case .isLoading:    return  SkeletonLoadingView()
        case .isSuccess:    return  Text("Success")
        }
    }
}
