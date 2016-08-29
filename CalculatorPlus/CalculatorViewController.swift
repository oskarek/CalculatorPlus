//
//  CalculatorViewController.swift
//  CalculatorPlus
//
//  Created by Oskar Ek on 2016-07-12.
//  Copyright © 2016 Oskar Ek. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AudioToolbox

class CalculatorViewController: UIViewController {
  
  // MARK: Dependencies
  
  private var viewModel = CalculatorViewModel()
  
  private var disposeBag = DisposeBag()
  
  // MARK: Outlets
  
  @IBOutlet weak var keypad: UIStackView!
  
  @IBOutlet weak var clearButton: UIButton!
  
  @IBOutlet weak var zeroButton: UIButton!
  @IBOutlet weak var oneButton: UIButton!
  @IBOutlet weak var twoButton: UIButton!
  @IBOutlet weak var threeButton: UIButton!
  @IBOutlet weak var fourButton: UIButton!
  @IBOutlet weak var fiveButton: UIButton!
  @IBOutlet weak var sixButton: UIButton!
  @IBOutlet weak var sevenButton: UIButton!
  @IBOutlet weak var eightButton: UIButton!
  @IBOutlet weak var nineButton: UIButton!
  
  @IBOutlet weak var multiplyButton: UIButton!
  @IBOutlet weak var divideButton: UIButton!
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var subtractButton: UIButton!
  
  @IBOutlet weak var sinButton: UIButton!
  @IBOutlet weak var cosButton: UIButton!
  @IBOutlet weak var tanButton: UIButton!
  @IBOutlet weak var sqrtButton: UIButton!
  
  @IBOutlet weak var piButton: UIButton!
  @IBOutlet weak var eButton: UIButton!
  
  @IBOutlet weak var leftParenButton: UIButton!
  @IBOutlet weak var rightParenButton: UIButton!
  
  @IBOutlet weak var delimiterButton: UIButton! {
    didSet {
      // Set localized delimiter button title
      delimiterButton.setTitle(.decimal, for: .normal)
    }
  }
  
  @IBOutlet var display: UILabel!
  
  @IBOutlet var resultDisplay: UILabel!
  
  // MARK: Private properties
  
  // All the UIButtons of the calculator, represented as CalculatorButtons
  private var buttons: [CalculatorButton] {
    return [
      .init(uiButton: clearButton, primaryAction: .clear),
      .init(uiButton: zeroButton, primaryAction: .add(.number(0)), secondaryAction: .add(.number(0))),
      .init(uiButton: oneButton, primaryAction: .add(.number(1)), secondaryAction: .add(.number(1))),
      .init(uiButton: twoButton, primaryAction: .add(.number(2)), secondaryAction: .add(.number(4))),
      .init(uiButton: threeButton, primaryAction: .add(.number(3)), secondaryAction: .add(.number(9))),
      .init(uiButton: fourButton, primaryAction: .add(.number(4)), secondaryAction: .add(.number(16))),
      .init(uiButton: fiveButton, primaryAction: .add(.number(5)), secondaryAction: .add(.number(25))),
      .init(uiButton: sixButton, primaryAction: .add(.number(6)), secondaryAction: .add(.number(36))),
      .init(uiButton: sevenButton, primaryAction: .add(.number(7)), secondaryAction: .add(.number(49))),
      .init(uiButton: eightButton, primaryAction: .add(.number(8)), secondaryAction: .add(.number(64))),
      .init(uiButton: nineButton, primaryAction: .add(.number(9)), secondaryAction: .add(.number(81))),
      .init(uiButton: delimiterButton, primaryAction: .add(.decimal)),
      .init(uiButton: leftParenButton, primaryAction: .add(.leftParen)),
      .init(uiButton: rightParenButton, primaryAction: .add(.rightParen)),
      .init(uiButton: piButton, primaryAction: .add(.operation(.pi))),
      .init(uiButton: eButton, primaryAction: .add(.operation(.e))),
      .init(uiButton: sinButton, primaryAction: .add(.operation(.sin)), secondaryAction: .add(.operation(.asin))),
      .init(uiButton: cosButton, primaryAction: .add(.operation(.cos)), secondaryAction: .add(.operation(.acos))),
      .init(uiButton: tanButton, primaryAction: .add(.operation(.tan)), secondaryAction: .add(.operation(.atan))),
      .init(uiButton: sqrtButton, primaryAction: .add(.operation(.sqrt))),
      .init(uiButton: multiplyButton, primaryAction: .add(.operation(.multiply))),
      .init(uiButton: divideButton, primaryAction: .add(.operation(.divide))),
      .init(uiButton: addButton, primaryAction: .add(.operation(.add))),
      .init(uiButton: subtractButton, primaryAction: .add(.operation(.subtract)))
    ]
  }
  
  // MARK: View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let buttons = self.buttons
    
    bindUIToViewModel(buttons: buttons)
    
    bindViewModelToUI()
    
    setUpAnimations(buttons: buttons)
  }
  
  // MARK: Bindings
  
  // Set up all the bindings from the view model to the UI
  private func bindViewModelToUI() {

    viewModel.displayText
      .bindTo(display.rx.text)
      .addDisposableTo(disposeBag)

    viewModel.resultText
      .bindTo(resultDisplay.rx.text)
      .addDisposableTo(disposeBag)
  }
  
  // Set up all the bindings from the UI to the view model
  private func bindUIToViewModel(buttons: [CalculatorButton]) {
    
    let primaryActions = Observable.from(
      buttons.map { b in b.uiButton.rx.shortpress.map { _ in b.primaryAction } })
      .merge()
    
    let secondaryActions = Observable.from(
      buttons.map { b in b.uiButton.rx.longpress.map { _ in b.secondaryAction ?? b.primaryAction } })
      .merge()
    
    let actions = Observable.of(primaryActions, secondaryActions).merge()
    
    actions
      .bindTo(viewModel.actions)
      .addDisposableTo(disposeBag)
  }
  
  // MARK: Direct UI work
  
  // Set up all of the animations
  private func setUpAnimations(buttons: [CalculatorButton]) {
    // Animate a flash on each button that is long pressed
    Observable.from(buttons.map { $0.uiButton.rx.longpress })
      .merge()
      .subscribe(onNext: { button in
        button.animateFlash()
      })
      .addDisposableTo(disposeBag)
  }
}
