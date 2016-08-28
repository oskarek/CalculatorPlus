//
//  MathBrain.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-14.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

struct MathBrain {
  
  private let lexer = MathExpressionLexer()
  
  static func parse(_ expression: String) -> Double {
    return expression.components(separatedBy: "+").flatMap(Double.init).reduce(0, +)
  }
  
  static func _parse(_ expression: String) -> Double {
    // TODO: implement
    return 0
  }
  
}

struct MathExpressionLexer {
  
  
  
}
