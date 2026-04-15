//
//  ViewValues.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 31/03/26.
//

import SwiftUI
import Observation

enum FontT {
    case primaryF
    case secondaryF
    case titleF
    case amountF
    
    var valueF: CGFloat  {
        switch self {
        case.amountF:
            return UIFontMetrics(forTextStyle: .largeTitle)
                .scaledValue(for: 44)
        case .titleF:
            return UIFontMetrics(forTextStyle: .largeTitle).scaledValue(for: 24)
        case .primaryF:
            return UIFontMetrics(forTextStyle: .title2).scaledValue(for: 18)
        case .secondaryF:
            return UIFontMetrics(forTextStyle: .body).scaledValue(for:13.5)
        }
    }
}

enum ButtonT {
    case buttonIcPad
    
    enum BWidth {
        case infiniteW
        case circleW
        case smallW
        
        var valueBW: CGFloat  {
            switch self {
            case .infiniteW:            return .infinity
            case .circleW:              return 52
            case .smallW:              return 44
            }
        }
    }
    
    enum BHeight {
        case circleH
        case largeH
        case smallH
        
        var valusBH: CGFloat  {
            switch self {
            case .circleH:              return 52
            case .largeH:               return 80
            case .smallH:               return 44
            }
        }
    }
    
    var valueBP: CGFloat  {
        switch self {
        case .buttonIcPad:              return 10
        }
    }
    
    enum BColor {
        case ColWhite
        case ColBlack
        case ColAccent
        case ColPrimary
        case ColGreen
        case ColSysBack
        case ColSysGray
        case ColGrayStatic
        
        var valueBC: Color  {
            switch self {
            case .ColWhite:        return Color.white
            case .ColBlack:        return Color.black
            case .ColAccent:        return Color.accentColor
            case .ColPrimary:        return Color.primary
            case .ColGreen:        return Color(UIColor.systemGreen)
            case .ColSysBack:        return Color(UIColor.systemBackground)
            case .ColSysGray:        return Color(UIColor.systemGray6)
            case .ColGrayStatic:        return Color.gray
            }
        }
    }
}
  
enum ShadowT {
    case shadowX
    case shadowY
    case shadowR
    
    var valueS: CGFloat  {
        switch self {
        case .shadowX:                  return 0
        case .shadowY:                  return 0
        case .shadowR:                  return 10
        }
    }
    
    enum SColor {
        case color
        
        var valueSC: Color  {
            switch self {
            case .color:                return Color.black.opacity(0.15)
            }
        }
    }
}

enum CardT {
    case cardColCust(ColorScheme)
    case cardColPri
    case cardColAcc
    case cardColGray
    case cardColClear
    
    
    enum CMaterial {
        case cardColThinMaterial
        case cardColRegularMaterial
        var valueCM: Material  {
            switch self {
            case .cardColThinMaterial:      return .ultraThinMaterial
            case .cardColRegularMaterial:      return .regularMaterial
            }
        }
        
    }
    
    enum CHeight {
        case smallH
        case xSmallH
        case smallMidH
        case mediumH
        case largeH
        case xLargeH
        case xxLargeH
        
        var cardCH: CGFloat  {
            switch self {
            case .smallH:               return 65
            case .xSmallH:              return 50
            case .smallMidH:            return 100
            case .mediumH:              return 130
            case .largeH:               return 170
            case .xLargeH:              return 200
            case .xxLargeH:             return 280
            }
        }
    }
    
    enum CWidth {
        case smallW
        case smallMidW
        case mediumW
        case largeW
        case xSmallW
        
        var valueCW: CGFloat  {
            switch self {
            case .smallW:               return 65
            case .xSmallW:              return 50
            case .smallMidW:            return 90
            case .mediumW:              return 195
            case .largeW:               return .infinity
            }
        }
    }
    
    enum CRadNPad {
        case radius
        case IconPad
            
        var valueCR: CGFloat  {
            switch self {
            case .IconPad:              return 18
            case .radius:               return 30
            }
        }
    }
    
    var valueCC: Color {
        switch self {
        case .cardColCust(let scheme):  return scheme == .dark ? Color(uiColor: .black) : Color(uiColor: .systemGray6)
        case .cardColAcc:               return Color.accentColor
        case .cardColPri:               return Color.primary
        case .cardColGray:              return Color(UIColor.systemGray6)
        case .cardColClear:              return Color.clear  
        }
    }
}


