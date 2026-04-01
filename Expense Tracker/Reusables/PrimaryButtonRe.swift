//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct PrimaryButton: View {
    let buttonDisplay: String
    let infinite: Bool
    let action: () -> Void
    
    
    var body: some View {
        VStack {
            Button(action: action) {
                PolymorphicButtonContent(isImage: buttonDisplay, infinite: infinite)
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct PrimaryNavigationButton<Destination: View>: View {
    let buttonDisplay: String
    let infinite: Bool
    let destination: Destination
    
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: destination) {
                    PolymorphicButtonContent(isImage: buttonDisplay, infinite: infinite)
                }
                .buttonStyle(PrimaryButtonStyle())
            }
        }
    }
}

#Preview {
    PrimaryButton(buttonDisplay: "apple.homekit", infinite: false, action: {})
}

//#Preview {
//    PrimaryNavigationButton(buttonIcon: "apple.homekit", infinite: false, destination: EmptyView())
//}
