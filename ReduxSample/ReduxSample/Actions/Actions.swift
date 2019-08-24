//
//  Actions.swift
//  ReduxSample
//
//  Created by Marcos Lacerda on 24/08/19.
//  Copyright © 2019 Marcos Lacerda. All rights reserved.
//

import ReSwift

// MARK: - Actions

struct ChooseWeaponAction: Action {
  
  var weapon: Weapon
  
}

struct StartNewGameAction: Action {}
