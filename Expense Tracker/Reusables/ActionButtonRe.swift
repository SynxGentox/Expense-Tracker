//
//  ActionButton.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct ActionButton: View {
    let buttonDisplay: String
    let infinite: Bool
    let alignLeft: Bool
    let action: () -> Void
    
    
    var body: some View {
        VStack {
            Button(action: action) {
                PolymorphicButtonContent(
                    isImage: buttonDisplay,
                    infinite: infinite,
                    alignLeft: alignLeft
                )
            }
            .buttonStyle(ActionButtonStyle())
        }
    }
}

struct ActionNavigationButton<Destination: View>: View {
    let buttonDisplay: String
    let infinite: Bool
    let alignLeft: Bool
    let destination: Destination
    
    
    var body: some View {
        VStack {
            NavigationLink(destination: destination) {
                PolymorphicButtonContent(
                    isImage: buttonDisplay,
                    infinite: infinite,
                    alignLeft: alignLeft
                )
            }
            .buttonStyle(ActionButtonStyle())
        }
    }
}


#Preview {
    ActionButton(buttonDisplay: "apple.homekit", infinite: false, alignLeft: false, action: {})
}

//#Preview {
//    ActionNavigationButton(buttonIcon: "apple.homekit", infinite: false, destination: EmptyView())
//}
