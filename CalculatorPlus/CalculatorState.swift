//
//  CalculatorState.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-13.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

struct CalculatorState {
  /// A clean state.
  static let cleared = CalculatorState(mathComponents: [])
  
  var resultString: String {
    return mathComponents
      .flatMap { Int($0.description) }
      .reduce(0, +)
      .description
  }
  var displayString: String {
    return mathComponents.map{ $0.description }.joined()
  }
  let mathComponents: [MathComponent]
}

extension CalculatorState {
  /**
   Transform into a new state by applying an action.
   
   - parameter action: The action responsible for the state change.
  */
  func transformed(with action: CalculatorAction) -> CalculatorState {
    
    switch action {
    case .clear:
      return .cleared
    case .add(let comp):
      return CalculatorState(mathComponents: mathComponents + [comp])
    }
  }
}
