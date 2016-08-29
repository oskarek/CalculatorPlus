//
//  MathBrain.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-14.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Foundation
import RxSwift

struct MathBrain {
  
  private let lexer = MathExpressionLexer()
  
  static func calculateResult(_ expression: String) -> Observable<Double> {
    return Observable.create { observer in
      DispatchQueue.global(qos: .utility).async {
        let res = expression.components(separatedBy: "+").flatMap(Double.init).reduce(0, +)
        DispatchQueue.main.async {
          observer.on(.next(res))
          observer.on(.completed)
        }
      }
      return Disposables.create()
    }
  }
  
  static func _parse(_ expression: String) -> Double {
    // TODO: implement
    return 0
  }
  
}

struct MathExpressionLexer {
  
  
  
}
