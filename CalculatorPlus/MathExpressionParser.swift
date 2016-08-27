//
//  MathExpressionParser.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-14.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

struct MathExpressionParser {
  
  static func parse(_ expression: String) -> Double {
    return expression.components(separatedBy: "+").flatMap(Double.init).reduce(0, +)
  }
  
}
