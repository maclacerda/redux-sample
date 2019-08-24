//
//  ReduxSampleTests.swift
//  ReduxSampleTests
//
//  Created by Marcos Lacerda on 24/08/19.
//  Copyright © 2019 Marcos Lacerda. All rights reserved.
//

import ReSwift
import XCTest
@testable import ReduxSample

class ReduxSampleTests: XCTestCase {

  func testPlayerOneWins() {
    let store = Store<State>(reducer: appReducer, state: nil)
    
    // Player one choose
    store.dispatch(ChooseWeaponAction(weapon: .rock))
    
    // Player two choose
    store.dispatch(ChooseWeaponAction(weapon: .scissors))
    
    // Check result
    XCTAssertEqual(store.state.result, .playerOneWins)
  }
  
  func testPlayerTwoWins() {
    let store = Store<State>(reducer: appReducer, state: nil)

    // Player one choose
    store.dispatch(ChooseWeaponAction(weapon: .rock))
    
    // Player two choose
    store.dispatch(ChooseWeaponAction(weapon: .paper))
    
    // Check result
    XCTAssertEqual(store.state.result, .playerTwoWins)
  }
  
  func testDraw() {
    let store = Store<State>(reducer: appReducer, state: nil)
    
    // Player one choose
    store.dispatch(ChooseWeaponAction(weapon: .rock))
    
    // Player two choose
    store.dispatch(ChooseWeaponAction(weapon: .rock))
    
    // Check result
    XCTAssertEqual(store.state.result, .draw)
  }

}
