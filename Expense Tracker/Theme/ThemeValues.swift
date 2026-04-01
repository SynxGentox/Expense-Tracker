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
            return UIFontMetrics(forTextStyle: .extraLargeTitle)
                .scaledValue(for: 60)
        case .titleF:
            return UIFontMetrics(forTextStyle: .largeTitle).scaledValue(for: 26)
        case .primaryF:
            return UIFontMetrics(forTextStyle: .title2).scaledValue(for: 20)
        case .secondaryF:
            return UIFontMetrics(forTextStyle: .body).scaledValue(for:14)
        }
    }
}

enum ButtonT {
    case buttonIcPad
    
    enum BWidth {
        case infiniteW
        case circleW
        
        var valueBW: CGFloat  {
            switch self {
            case .infiniteW:        return .infinity
            case .circleW:          return 60
            }
        }
    }
    
    enum BHeight {
        case circleH
        case largeH
        
        var valusBH: CGFloat  {
            switch self {
            case .circleH:          return 60
            case .largeH:           return 80
            }
        }
    }
    
    var valueBP: CGFloat  {
        switch self {
        case .buttonIcPad:    return 8
        }
    }
}
  
enum ShadowT {
    case shadowX
    case shadowY
    case shadowR
    
    var valueS: CGFloat  {
        switch self {
        case .shadowX:              return 0
        case .shadowY:              return 0
        case .shadowR:              return 10
        }
    }
    
    enum SColor {
        case color
        
        var valueSC: Color  {
            switch self {
            case .color:            return Color.black.opacity(0.15)
            }
        }
    }
}

enum CardT {
    case backCol
    case iconCol
    case iconBack
    
    enum CHeight {
        case smallH
        case smallMidH
        case mediumH
        case largeH
        
        var cardCH: CGFloat  {
            switch self {
            case .smallH:           return 65
            case .smallMidH:        return 110
            case .mediumH:          return 130
            case .largeH:           return 155
            }
        }
    }
    
    enum CWidth {
        case smallW
        case mediumW
        case largeW
        
        var valueCW: CGFloat  {
            switch self {
            case .smallW:           return 65
            case .mediumW:          return 200
            case .largeW:           return .infinity
            }
        }
    }
    
    enum CRadNPad {
        case radius
        case IconPad
            
        var valueCR: CGFloat  {
            switch self {
            case .IconPad:  return 18
            case .radius:           return 30
            }
        }
    }
    
    var valueCC: Color {
        switch self {
        case .backCol:            return Color(UIColor.systemGray6)
        case .iconCol:        return Color.accentColor
        case .iconBack:   return Color(.systemBackground)
        }
    }
}


