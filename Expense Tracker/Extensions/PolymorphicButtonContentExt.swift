//
//  ButtonDIsHelper.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 01/04/26.
//

import SwiftUI

//protocol ButtonDisHelper {
//    func isImage(from str: String) -> any View
//}
//
//extension Text: ButtonDisHelper {
//    public func isImage(from str: String) -> any View {
//        Text(str)
//    }
//}


struct PolymorphicButtonStyle: View {
    let isImage: String
    let infinite: Bool
    let alignLeft: Bool
    var body: some View {
        isImage(str: isImage)
    }
    @ViewBuilder
    func isImage(str: String) -> some View {
        if UIImage(systemName: str) != nil {
            Image(systemName: str)
                .buttonIconStyleExt(
                    buttonHeight: ButtonT.BHeight.circleH.valusBH,
                    buttonWidth: infinite ? ButtonT.BWidth.infiniteW.valueBW : ButtonT.BWidth.circleW.valueBW,
                    iconColor: ButtonT.BColor.ColSysBack.valueBC, alignLeft: alignLeft
                )
        }
        else if UIImage(named: str) != nil {
            Image(str)
                .buttonIconStyleExt(
                    buttonHeight: ButtonT.BHeight.circleH.valusBH,
                    buttonWidth: infinite ? ButtonT.BWidth.infiniteW.valueBW : ButtonT.BWidth.circleW.valueBW,
                    iconColor: ButtonT.BColor.ColSysBack.valueBC, alignLeft: alignLeft
                )
        }
        else {
            Text(str)
                .amountFontStyleExt(numSize: FontT.primaryF.valueF)
                .foregroundStyle(ButtonT.BColor.ColSysBack.valueBC)
                .padding(ButtonT.buttonIcPad.valueBP)
                .frame(
                    maxWidth: infinite ? ButtonT.BWidth.infiniteW.valueBW : ButtonT.BWidth.circleW.valueBW,
                    maxHeight: ButtonT.BHeight.circleH.valusBH
                )
        }
    }
}
