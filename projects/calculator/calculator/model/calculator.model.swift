//
//  calculator.model.swift
//  calculator
//
//  Created by Shushant  on 10/08/25.
//

import Foundation
import SwiftUI

enum Keys:String{
    case zero   = "0"
    case one    = "1"
    case two    = "2"
    case three  = "3"
    case four   = "4"
    case five   = "5"
    case six    = "6"
    case seven  = "7"
    case eight  = "8"
    case nine   = "9"
    case add    = "+"
    case subtract = "-"
    case multiply = "x"
    case divide  = "÷"
    case equal   = "="
    case clear   = "AC"
    case decimal  = "."
    case percent  = "%"
    case negative = "-/+"
    
    var buttonColor: Color{
        switch self {
        case .add,.subtract,.multiply,.divide,.equal:
                return Color("v_operator")
        case .clear, .negative, .percent:
            return Color("h_operator")
        default :
            return Color("number")
        }
    }
    
}

enum Operation{
    case add , multiply, divide, subtract ,none
    
}
