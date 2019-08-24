//
//  Reducers.swift
//  ReduxSample
//
//  Created by Marcos Lacerda on 24/08/19.
//  Copyright © 2019 Marcos Lacerda. All rights reserved.
//

import ReSwift

// MARK: - Reducers

func appReducer(action: Action, state: State?) -> State {
  
  // Case the state == nil then creating a new state
  var state = state ?? State()
  
  switch action {
  case let chooseWeaponAction as ChooseWeaponAction:
    let turn = state.turn
    
    switch turn.player {
    case .one:
      // Create a play
      let play = Play(chosen: true, weapon: chooseWeaponAction.weapon)
      
      state.playerOne = play
      
      // Pass turn to next player
      state.turn = Turn(player: .two)
      
      // Change the message
      state.message = .playerTwoChoose
      
    case .two:
      // Create a play
      let play = Play(chosen: true, weapon: chooseWeaponAction.weapon)
      
      state.playerTwo = play
      
      // Calculate who won
      let playerOneWeapon = state.playerOne.weapon ?? .rock
      let playerTwoWeapon = state.playerTwo.weapon ?? .rock
      
      switch playerOneWeapon {
      case .rock:
        switch playerTwoWeapon {
        case .rock:
          state.result = .draw
          state.message = .draw
          
        case .paper:
          state.result = .playerTwoWins
          state.message = .playerTwoWins
          
        case .scissors:
          state.result = .playerOneWins
          state.message = .playerOneWins
        }
        
      case .paper:
        switch playerTwoWeapon {
        case .rock:
          state.result = .playerOneWins
          state.message = .playerOneWins
          
        case .paper:
          state.result = .draw
          state.message = .draw
          
        case .scissors:
          state.result = .playerTwoWins
          state.message = .playerTwoWins
        }
        
      case .scissors:
        switch playerTwoWeapon {
        case .rock:
          state.result = .playerTwoWins
          state.message = .playerTwoWins
          
        case .paper:
          state.result = .playerOneWins
          state.message = .playerOneWins
          
        case .scissors:
          state.result = .draw
          state.message = .draw
        }
      }
    }
    
  case _ as StartNewGameAction:
    state = State()
    
  default: break
  }
  
  // Return the new state
  return state
  
}

