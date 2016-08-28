//
//  MathComponent.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-17.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

enum MathComponent {
  case number(Int)
  case leftParen
  case rightParen
  case decimal
  case operation(Operation)
}

extension MathComponent: CustomStringConvertible {
  var description: String {
    switch self {
    case .number(let value): return String(value)
    case .leftParen: return "("
    case .rightParen: return ")"
    case .decimal: return .decimal
    case .operation(let op): return op.description
    }
  }
}
