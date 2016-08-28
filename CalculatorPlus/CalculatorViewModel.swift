//
//  CalculatorViewModel.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-21.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import UIKit
import RxSwift

struct CalculatorViewModel {
  
  // MARK: Model
  
  private var disposeBag = DisposeBag()
  
  private var calculatorState = Variable<CalculatorState>(.cleared)
  
  // MARK: Variables
  
  /// The current string to display in the calculator display
  var displayText: Observable<String?>
  
  /// The current string to display in the result display
  var resultText: Observable<String?>
  
  /// Actions to change the state of the calculator
  var actions = PublishSubject<CalculatorAction>()
  
  init() {
    
    let state = actions
      .scan(CalculatorState.cleared) { (state, action) in
        state.transformed(with: action)
      }
    
    displayText = state.map { state in state.displayString }
    
    resultText = state.map { state in state.resultString } 
  }
}
