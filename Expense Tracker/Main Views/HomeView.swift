//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 30/03/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
//        let plusButtonBottomPadding: CGFloat = 4
//        let plusButtonSize: CGFloat = 40
        ZStack {
            TabView {
                Tab.init("Home", systemImage: "house.fill") {
                }
                
                Tab.init(
                    "History",
                    systemImage: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90"
                ) {
                    
                }
                
                Tab.init("Reports", systemImage: "list.clipboard.fill") {
                    
                }
                
                Tab.init("Account", systemImage: "person.crop.circle.fill") {
                    
                }
            }
            
            
            
        }
    }
}

#Preview {
    HomeView()
}
