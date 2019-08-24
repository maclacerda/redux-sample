//
//  State.swift
//  ReduxSample
//
//  Created by Marcos Lacerda on 24/08/19.
//  Copyright © 2019 Marcos Lacerda. All rights reserved.
//

import ReSwift

// MARK: - Application States

struct State: StateType {
  
  var message: Message
  var turn: Turn
  var playerOne: Play
  var playerTwo: Play
  var result: Result?
  
  init() {
    self.message = .playerOneChoose
    self.turn = Turn(player: .one)
    self.playerOne = Play(chosen: false, weapon: nil)
    self.playerTwo = Play(chosen: false, weapon: nil)
  }
  
}

// MARK: - Messages & Options

enum Message: String {
  
  case playerOneChoose = "Player One - Choose your weapon"
  case playerTwoChoose = "Player Two - Choose your weapon"
  case playerOneWins = "Player One Wins!"
  case playerTwoWins = "Player Two Wins!"
  case draw = "Draw!"
  
}

struct Turn {
  
  var player: Player
  
}

enum Player {
  
  case one
  case two
  
}

struct Play {
  
  var chosen: Bool
  var weapon: Weapon?
  
}

enum Weapon: String {
  
  case rock = "Rock"
  case paper = "Paper"
  case scissors = "Scissors"
  
}

enum Result {
  
  case draw
  case playerOneWins
  case playerTwoWins
  
}
