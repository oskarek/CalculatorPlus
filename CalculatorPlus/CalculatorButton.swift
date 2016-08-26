//
//  CalculatorButton.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-21.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import UIKit

struct CalculatorButton {
  let uiButton: UIButton
  let primaryAction: CalculatorAction
  let secondaryAction: CalculatorAction?
  
  /// Initialize a CalculatorButton.
  /// - parameter uiButton: The UIButton linked to this CalculatorButton.
  /// - parameter primaryAction: The primary calculator action of this button.
  /// - parameter secondaryAction: The secondary calculator action of this button.
  ///                              Default value is `primaryAction`.
  init(uiButton: UIButton, primaryAction: CalculatorAction, secondaryAction: CalculatorAction? = .none) {
    self.uiButton = uiButton
    self.primaryAction = primaryAction
    self.secondaryAction = secondaryAction
  }
}
