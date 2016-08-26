//
//  UIButton+Extensions.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-21.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//  Touch extensions
extension Reactive where Base: UIButton {
  
  private var delayedRelease: Observable<Void> {
    let cancelled = Observable.from([
      controlEvent(.touchUpInside),
      controlEvent(.touchDragOutside)
      ])
      .merge()

    return Observable.just(())
      .delaySubscription(0.3, scheduler: MainScheduler.instance)
      .takeUntil(cancelled)
  }
  /// Listen for a press of the button that lasts 0.3s or *longer*.
  var longpress: ControlEvent<Base> {
    let source = controlEvent(.touchDown)
      .flatMapLatest { _ in
        self.delayedRelease
          .map { _ in self.base }
      }.takeUntil(deallocated)
    return ControlEvent(events: source)
  }
  /// Listen for a press of the button that lasts *shorter* than 0.3s.
  var shortpress: ControlEvent<Base> {
    let source = controlEvent(.touchDown)
      .flatMapLatest { _ in
        self.controlEvent(.touchUpInside)
          .map { _ in self.base }
          .takeUntil(self.delayedRelease)
      }.takeUntil(deallocated)
    return ControlEvent(events: source)
  }
}

extension UIButton {
  
  func animateFlash() {
    let whitebox = UIView(frame: bounds)
    whitebox.backgroundColor = .white
    whitebox.alpha = 0
    addSubview(whitebox)
    
    let reverseAnimation = { (_: Bool) in
      UIView.animate(withDuration: 0.08,
                     animations: { whitebox.alpha = 0},
                     completion: { _ in whitebox.removeFromSuperview() })
    }
    
    UIView.animate(withDuration: 0.08,
                   animations: { whitebox.alpha = 0.4 },
                   completion: reverseAnimation)
  }
  
}
