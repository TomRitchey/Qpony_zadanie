//
//  ButtonState.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 05/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//

import Foundation
import UIKit

protocol ButtonStateProtocol {
  func returnColor() -> UIColor
  func returnText() -> String
}

class ButtonStateDefault: ButtonStateProtocol {
  
  var color:UIColor = UIColor.whiteColor()
  var text:String = "Default State"
  
  func returnColor() -> UIColor {
    return self.color
  }
  
  func returnText() -> String {
    return self.text
  }
  static func getState(state:buttonStatesEnum) -> ButtonStateDefault {
    switch state {
    case .StateOne:
      return ButtonStateFirst()
    case .StateTwo:
      return ButtonStateSecond()
    case .StateThree:
      return ButtonStateThird()
    case .StateFour:
      return ButtonStateFourth()
    case .StateFive:
      return ButtonStateFifth()
    default:
      return ButtonStateDefault()
    }
  }
}

//MARK: Button states

enum buttonStatesEnum{
  case StateOne, StateTwo, StateThree, StateFour, StateFive, StateDefault
}

class ButtonStateFirst: ButtonStateDefault {
  override init() {
    super.init()
    self.color = UIColor.greenColor()
    self.text = "First State"
  }
}

class ButtonStateSecond: ButtonStateDefault {
  override init() {
    super.init()
    self.color = UIColor.yellowColor()
    self.text = "Second State"
  }
}

class ButtonStateThird: ButtonStateDefault {
  override init() {
    super.init()
    self.color = UIColor.brownColor()
    self.text = "Third State"
  }
}

class ButtonStateFourth: ButtonStateDefault {
  override init() {
    super.init()
    self.color = UIColor.redColor()
    self.text = "Fourth State"
  }
}

class ButtonStateFifth: ButtonStateDefault {
  override init() {
    super.init()
    self.color = UIColor.orangeColor()
    self.text = "Fifth State"
  }
}