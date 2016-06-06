//
//  ButtonWithState.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 05/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//

import Foundation
import UIKit

protocol ButtonWithStateDelegate:class {
  func buttonStateChanged()
}

class ButtonWithState: UIButton {
  //MARK: properties
  
  weak var delegate:ButtonWithStateDelegate?
  var stateListOfEnums:Array<buttonStatesEnum>!
  var buttonState:ButtonStateProtocol?
  var currentStateIndex = 0
  
  var color:UIColor {
    get{
      return butonState.returnColor()
    }
  }
  var text:String {
    get {
      return butonState.returnText()
    }
  }
  var butonState: ButtonStateProtocol!
  //MARK: methods
  
  override init(frame:CGRect){ // allows to create button programmatically
    super.init(frame: frame)
    self.initRoutine()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    self.initRoutine()
  }
  
  func initRoutine(){
    self.stateListOfEnums = Array()
    self.initialStates()
    self.changeStateEnum(toState: stateListOfEnums[0])
  }
  
  func initialStates() { // Override this func in subclass to add default states at button init
    
    stateListOfEnums.append(buttonStatesEnum.StateDefault)
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    self.traverseState()
  }
  
  func changeStateEnum(toState newState:buttonStatesEnum) {
    
    self.delegate?.buttonStateChanged()
    self.butonState = ButtonStateDefault.getState(newState)
    self.layer.backgroundColor = self.butonState.returnColor().CGColor
    self.layer.borderColor = self.butonState.returnColor().CGColor
    self.setTitle(self.butonState.returnText(), forState: UIControlState.Normal)
  }
  
  func traverseState(){
    currentStateIndex += 1
    if currentStateIndex >= stateListOfEnums.count {
      currentStateIndex = 0
    }
    
    self.changeStateEnum(toState: stateListOfEnums[currentStateIndex])
  }
  
}

class ButtonWithStateOne: ButtonWithState {
  
  override func initialStates(){
    stateListOfEnums.append(buttonStatesEnum.StateOne)
    stateListOfEnums.append(buttonStatesEnum.StateTwo)
    stateListOfEnums.append(buttonStatesEnum.StateThree)
  }
}

class ButtonWithStateTwo: ButtonWithState {
  
  override func initialStates(){
    stateListOfEnums.append(buttonStatesEnum.StateFive)
    stateListOfEnums.append(buttonStatesEnum.StateOne)
    stateListOfEnums.append(buttonStatesEnum.StateFour)
    stateListOfEnums.append(buttonStatesEnum.StateTwo)
  }
}