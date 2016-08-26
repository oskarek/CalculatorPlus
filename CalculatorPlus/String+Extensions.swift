//
//  String+Extensions.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-13.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation

extension String {
  /// The character the receiver uses as a decimal separator.
  static var decimal: String {
    return NumberFormatter().decimalSeparator
  }
}
