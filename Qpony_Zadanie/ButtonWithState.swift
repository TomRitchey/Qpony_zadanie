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
  var stateList:Array<ButtonStateProtocol>!
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
  
  override init(frame:CGRect){ //
    super.init(frame: frame)
    self.initRoutine()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    self.initRoutine()
  }
  
  func initRoutine(){
    self.stateList = Array()
    self.initialStates()
    self.changeState(toState: stateList[0])
  }
  
  func initialStates() { // Override this func do add default states at button init
    stateList.append(ButtonStateDefault())
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    self.traverseState()
  }
  
  func changeState(toState newState:ButtonStateProtocol) {
    
    self.delegate?.buttonStateChanged()
    self.butonState = newState
    self.layer.backgroundColor = newState.returnColor().CGColor
    self.layer.borderColor = newState.returnColor().CGColor
    self.setTitle(newState.returnText(), forState: UIControlState.Normal)
  }
  
  func traverseState(){
    currentStateIndex += 1
    if currentStateIndex >= stateList?.count {
      currentStateIndex = 0
    }
    
    self.changeState(toState: stateList![currentStateIndex])
  }
  
}

class ButtonWithStateOne: ButtonWithState {
  
  override func initialStates(){
    stateList.append(ButtonStateFirst())
    stateList.append(ButtonStateSecond())
    stateList.append(ButtonStateThird())
  }
}

class ButtonWithStateTwo: ButtonWithState {
  
  override func initialStates(){
    stateList.append(ButtonStateSecond())
    stateList.append(ButtonStateFourth())
    stateList.append(ButtonStateFirst())
    stateList.append(ButtonStateFifth())
  }
}