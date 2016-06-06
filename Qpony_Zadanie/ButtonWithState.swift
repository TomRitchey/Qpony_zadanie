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
  func buttonStateWillChange(button:String)
  func buttonStateChangedToState(state:String, ofButton button:String)
}

class ButtonWithState: UIButton {
  //MARK: properties
  
  weak var delegate:ButtonWithStateDelegate?
  var stateListOfEnums:Array<buttonStatesEnum>!
  var currentStateIndex = 0
  var buttonDescription:String?
  var buttonState: ButtonStateProtocol!
  
  var color:UIColor {
    get{
      return buttonState.returnColor()
    }
  }
  var text:String {
    get {
      return buttonState.returnText()
    }
  }
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
    self.changeState(toState: stateListOfEnums[0])
  }
  
  func initialStates() { // Override this func in subclass to add default states at button init
    
    stateListOfEnums.append(buttonStatesEnum.StateDefault)
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    self.traverseState()
  }
  
  func changeState(toState newState:buttonStatesEnum) {
    
    self.delegate?.buttonStateWillChange(self.buttonDescription!)
    self.buttonState = buttonStatesEnum.getState(newState)
    self.layer.backgroundColor = self.buttonState.returnColor().CGColor
    self.layer.borderColor = self.buttonState.returnColor().CGColor
    self.setTitle(self.buttonState.returnText(), forState: UIControlState.Normal)
    self.delegate?.buttonStateChangedToState(self.buttonState.returnText(), ofButton: self.buttonDescription!)
  }
  
  func traverseState(){
    currentStateIndex += 1
    if currentStateIndex >= stateListOfEnums.count {
      currentStateIndex = 0
    }
    
    self.changeState(toState: stateListOfEnums[currentStateIndex])
  }
  
}


//MARK:examle buttons with example states
class ButtonWithStateOne: ButtonWithState {
  
  override func initialStates(){
    self.buttonDescription = "Button One"
    stateListOfEnums.append(buttonStatesEnum.StateOne)
    stateListOfEnums.append(buttonStatesEnum.StateTwo)
    stateListOfEnums.append(buttonStatesEnum.StateThree)
  }
}

class ButtonWithStateTwo: ButtonWithState {
  
  override func initialStates(){
    
    self.buttonDescription = "Button Two"
    stateListOfEnums.append(buttonStatesEnum.StateFive)
    stateListOfEnums.append(buttonStatesEnum.StateOne)
    stateListOfEnums.append(buttonStatesEnum.StateFour)
    stateListOfEnums.append(buttonStatesEnum.StateTwo)
  }
}