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
}

//MARK: Button states

class ButtonStateFirst: ButtonStateDefault {
  override init() {
    super.init()
    self.color = UIColor.purpleColor()
    self.text = "First State"
  }
}

class ButtonStateSecond: ButtonStateDefault {
  override init() {
    super.init()
    self.color = UIColor.blueColor()
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