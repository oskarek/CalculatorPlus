//
//  Operation.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-17.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

enum Operation {
  case multiply
  case divide
  case add
  case subtract
  case pi
  case e
  case sin
  case cos
  case tan
  case asin
  case acos
  case atan
  case sqrt
  case squared
}

extension Operation: CustomStringConvertible {
  var description: String {
    switch self {
    case .multiply: return "×"
    case .divide: return "÷"
    case .add: return "+"
    case .subtract: return "-"
    case .pi: return "π"
    case .e: return "e"
    case .sin: return "sin"
    case .cos: return "cos"
    case .tan: return "tan"
    case .asin: return "asin"
    case .acos: return "acos"
    case .atan: return "atan"
    case .sqrt: return "√"
    case .squared: return "X²"
    }
  }
}
