//
//  MathComponent.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-17.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

enum MathComponent: CustomStringConvertible {
  case number(Int)
  case leftParen
  case rightParen
  case decimal
  case operation(Operation)
  
  var description: String {
    switch self {
    case .number(let value): return String.init(value)
    case .leftParen: return "("
    case .rightParen: return ")"
    case .decimal: return .decimal
    case .operation(let op): return op.description
    }
  }
}
