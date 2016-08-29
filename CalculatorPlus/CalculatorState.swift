//
//  CalculatorState.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-13.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation
import RxSwift

struct CalculatorState {
  /// A clean state.
  static let cleared = CalculatorState(mathComponents: [])
  
  init(mathComponents: [MathComponent]) {
    self.mathComponents = mathComponents
    let displayString = mathComponents.map{ $0.description }.joined()
    self.displayString = displayString
    resultStringObs = MathBrain.parse(displayString).map { $0.description }
  }
  
  let resultStringObs: Observable<String?>
  let displayString: String
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
