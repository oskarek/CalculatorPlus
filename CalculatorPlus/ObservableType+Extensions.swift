//
//  ObservableType+Extensions.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-08-29.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import Swift
import RxSwift

extension ObservableType {
  /// Bind to an observer which expects to receive 'Optional wrapped'
  /// versions of this observable's element.
  func bindTo<O: ObserverType>(_ observer: O) -> Disposable where O.E == E? {
    return self.map(Optional.init).subscribe(observer)
  }
}
