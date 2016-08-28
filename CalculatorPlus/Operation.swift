//
//  Operation.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-17.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

enum Operation: String {
  case multiply = "×"
  case divide = "÷"
  case add = "+"
  case subtract = "-"
  case pi = "π"
  case e = "e"
  case sin = "sin"
  case cos = "cos"
  case tan = "tan"
  case asin = "asin"
  case acos = "acos"
  case atan = "atan"
  case sqrt = "√"
  case squared = "X²"
}

extension Operation: CustomStringConvertible {
  var description: String {
    return rawValue
  }
}
