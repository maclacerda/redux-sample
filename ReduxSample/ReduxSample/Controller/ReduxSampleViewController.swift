//
//  ReduxSampleViewController.swift
//  ReduxSample
//
//  Created by Marcos Lacerda on 24/08/19.
//  Copyright © 2019 Marcos Lacerda. All rights reserved.
//

import ReSwift
import UIKit

class ReduxSampleViewController: UIViewController, StoreSubscriber {
  
  // MARK: - Outlets

  @IBOutlet weak fileprivate var message: UILabel!
  @IBOutlet weak fileprivate var placeholderOne: UILabel!
  @IBOutlet weak fileprivate var placeholderTwo: UILabel!
  @IBOutlet weak fileprivate var newGameView: UIStackView!
  
  fileprivate let store = Store<State>(reducer: appReducer, state: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()

    store.subscribe(self)
  }
  
  // MARK: - Actions
  
  @IBAction fileprivate func rockButtonClick() {
    store.dispatch(ChooseWeaponAction(weapon: .rock))
  }
  
  @IBAction fileprivate func paperButtonClick() {
    store.dispatch(ChooseWeaponAction(weapon: .paper))
  }
  
  @IBAction fileprivate func scissorsClickButton() {
    store.dispatch(ChooseWeaponAction(weapon: .scissors))
  }
  
  @IBAction fileprivate func newGameClick() {
    store.dispatch(StartNewGameAction())
    newGameView.isHidden = true
  }
  
  // MARK: - State handler
  
  func newState(state: State) {
    message.text = state.message.rawValue
    
    if state.playerTwo.chosen {
      placeholderOne.text = state.playerOne.weapon?.rawValue
      placeholderTwo.text = state.playerTwo.weapon?.rawValue

      newGameView.isHidden = false
    } else {
      placeholderOne.text = state.playerOne.chosen ? "chosen" : ""
      placeholderTwo.text = state.playerTwo.chosen ? "chosen" : ""
    }
  }

}
