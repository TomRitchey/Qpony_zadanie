//
//  SecondViewController.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 05/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,ButtonWithStateDelegate {
  //MARK: properties
  @IBOutlet weak var buttonWithStateOutlet: ButtonWithState!

  @IBOutlet weak var buttonWithStateOutlet2: ButtonWithState!
  //MARK: methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buttonWithStateOutlet.delegate = self
    buttonWithStateOutlet2.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func buttonStateChanged() {
    print("state changed")
  }

}

