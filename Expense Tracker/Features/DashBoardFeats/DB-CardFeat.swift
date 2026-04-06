//
//  DB-CardView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 03/04/26.
//

import SwiftUI

struct DB_CardFeat: View {
    let balance: Double
    var body: some View {
        ZStack {
            CardBackground(
                cornerRadius: CardT.CRadNPad.radius.valueCR,
                cardWidth: CardT.CWidth.largeW.valueCW,
                cardHeight: CardT.CHeight.xxLargeH.cardCH - 30,
                color: CardT.cardColGray.valueCC)
            .overlay {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        [0.0,0.0],[0.75,0.0],[1.0,1.0],[2.0,2.0],
                        [0.0,0.5],[0.5,0.5],[1.0,1.0],[1,1],
                        [1,1.0]
                    ],
                    colors: [.black, .white, .green,
                             .black,  .black,  .white,
                             .white, .green, .white]
                )
                .ignoresSafeArea()
            }
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .listRowSeparatorLeading) {
                        Text("Fedral Express")
                            .primaryFontStyleExt(
                                fontSize: FontT.primaryF.valueF
                            )
                        Text("Debit Card")
                            .secondaryFontStyleExt(
                                fontSize: FontT.secondaryF.valueF
                            )
                    }
                    .foregroundStyle(
                        ButtonT.BColor.ColGrayStatic.valueBC.gradient.quaternary
                    )
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    Image(systemName: "app.background.dotted")
                        .buttonIconStyleExt(
                            buttonHeight: ButtonT.BHeight.circleH.valusBH - 10,
                            buttonWidth: ButtonT.BWidth.circleW.valueBW - 10,
                            iconColor: ButtonT.BColor.ColGreen.valueBC,
                            alignLeft: false
                        )
                }
                Spacer()
                    .compositingGroup()
                DB_BalanceFeat(balance: balance)
                    .foregroundStyle(
                        ButtonT.BColor.ColGrayStatic.valueBC.gradient.quaternary
                    )
            }
            .overlay(alignment: .leading) {
                HStack {
                    Text("**** **** **** 3973")
                        .amountFontStyleExt(numSize: FontT.titleF.valueF)
                        .foregroundStyle(
                            ButtonT.BColor.ColBlack.valueBC.gradient.quaternary
                        )
                }
            }
            .padding(.leading)
            .padding(.trailing, 8)
            .padding(.vertical, 8)
        }
        .frame(
            maxWidth: CardT.CWidth.largeW.valueCW,
            maxHeight: CardT.CHeight.xxLargeH.cardCH - 30
        )
    }
}

#Preview {
    DB_CardFeat(balance: 7)
}
