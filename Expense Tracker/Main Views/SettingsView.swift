//
//  SettingsView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 06/04/26.
//

import SwiftUI

struct SettingsView: View {
    let arrAcc = [SettingsItems(title: "Profile", icon: "person.circle"),
                  SettingsItems(title: "Change password", icon: "person.badge.key")
    ]
    let arrGen = [SettingsItems(title: "Notificaitons", icon: "bell"),
                  SettingsItems(title: "Language", icon: "a.circle"),
                  SettingsItems(title: "Theme", icon: "swatchpalette"),
                  SettingsItems(title: "Currency", icon: "dollarsign.circle")
    ]
    let arrPre = [SettingsItems(title: "Support", icon: "questionmark.circle"),
                  SettingsItems(title: "Rate us", icon: "star.fill"),
                  SettingsItems(title: "Send Feedback", icon: "ladybug"),
                  SettingsItems(title: "About", icon: "info.circle")
    ]
    var body: some View {
            Form {
                ZStack(alignment: .leading) {
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "person.and.background.dotted")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .leading)
                            .padding(.trailing)
                            .foregroundStyle(.accent)
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
                    ForEach(arrAcc, id: \.title) { item in
                        NavigationLink {
                                
                            } label: {
                                HStack{
                                    Image(systemName: item.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 24, maxHeight: .infinity)
                                        .foregroundStyle(.accent)
                                        .padding(.trailing, 6)
                                    Text(item.title)
                                        .foregroundStyle(
                                            ButtonT.BColor.ColPrimary.valueBC
                                        )
                                }
                            }
                    }
                }
                
                Section("General") {
                    ForEach(arrGen, id: \.title) { item in
                        NavigationLink {
                                
                            } label: {
                                HStack{
                                    Image(systemName: item.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 24, maxHeight: .infinity)
                                        .padding(.trailing, 6)
                                        .foregroundStyle(.accent)
                                    Text(item.title)
                                        .foregroundStyle(
                                            ButtonT.BColor.ColPrimary.valueBC
                                        )
                                }
                            }
                    }
                }
                
                Section("Preferences") {
                    ForEach(arrPre, id: \.title) { item in
                            NavigationLink {
                                
                            } label: {
                                HStack{
                                    Image(systemName: item.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 24, maxHeight: .infinity)
                                        .padding(.trailing, 6)
                                        .foregroundStyle(.accent)
                                    Text(item.title)
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

#Preview {
    
    NavigationStack {
        SettingsView()
    }
}

struct SettingsItems {
    var title: String
    var icon: String
}
