//
//  SettingsView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import SwiftUI

struct SettingsView: View {
    let arrAcc = [
        "Profile" : "person.circle",
        "Privacy & Security" : "person.badge.key"
    ]
    let arrGen = [
        "Notification" : "bell",
        "Language" : "a.circle",
        "Appearance" : "swatchpalette",
        "Currency code" : "dollarsign.circle"
    ]
    let arrPre = [
        "Support" : "questionmark.circle",
        "Send feedback" : "ladybug",
        "About" : "info.circle"
    ]
    
    var body: some View {
        
        NavigationStack {
            Form {
                ZStack(alignment: .leading) {
                    ActionButton(
                        buttonDisplay: "person.and.background.dotted",
                        infinite: true,
                        alignLeft: true
                    ) {
                        
                    }
                    
                    Text("Gentox")
                        .amountFontStyleExt(numSize: FontT.titleF.valueF)
                        .padding(.leading, 70)
                    Button{
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .buttonIconStyleExt(
                                buttonHeight: ButtonT.BHeight.circleH.valusBH,
                                buttonWidth: ButtonT.BWidth.smallW.valueBW,
                                iconColor: ButtonT.BColor.ColPrimary.valueBC,
                                alignLeft: false
                            )
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .trailing
                    )
                    
                }
                Section("Account") {
                    ForEach(arrAcc.sorted(by: >), id: \.key) { (title, key) in
                        HStack{
                            Image(systemName: key)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 24, maxHeight: .infinity)
                                .padding(.horizontal, 4)
                            Button {
                                
                            } label: {
                                Text(title)
                                    .foregroundStyle(
                                        ButtonT.BColor.ColPrimary.valueBC
                                    )
                            }
                        }
                    }
                }
                
                Section("General") {
                    ForEach(arrGen.sorted(by: >), id: \.key) { (title, key) in
                        HStack{
                            Image(systemName: key)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 24, maxHeight: .infinity)
                                .padding(.horizontal, 4)
                            Button {
                                
                            } label: {
                                Text(title)
                                    .foregroundStyle(
                                        ButtonT.BColor.ColPrimary.valueBC
                                    )
                            }
                        }
                    }
                }
                
                Section("Preferences") {
                    ForEach(arrPre.sorted(by: >), id: \.key) { (title, key) in
                        HStack{
                            Image(systemName: key)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 24, maxHeight: .infinity)
                                .padding(.horizontal, 4)
                            Button {
                                
                            } label: {
                                Text(title)
                                    .foregroundStyle(
                                        ButtonT.BColor.ColPrimary.valueBC
                                    )
                            }
                        }
                    }
                }
            }
            .toolbarVisibility(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    SettingsView()
}
