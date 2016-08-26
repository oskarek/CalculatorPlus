//
//  Operation.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-17.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

enum Operation: CustomStringConvertible {
  case multiply, divide, add, subtract, pi, e, sin, cos, tan, asin, acos, atan, sqrt, squared
  
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
