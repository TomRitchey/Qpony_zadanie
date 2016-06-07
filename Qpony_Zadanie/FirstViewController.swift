//
//  FirstViewController.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 05/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//
// Poznań city Id = 3088171
// Pełny link http://api.openweathermap.org/data/2.5/forecast/daily?id=3088171&mode=json&units=metric&cnt=7&appid=ad4e521f54b155390c178acc59582f10

import UIKit

class FirstViewController: UIViewController {

  var jsnsns: JsonExtractor!
  
  let url = "http://api.openweathermap.org/data/2.5/forecast/daily?id=3088171&mode=json&units=metric&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    jsnsns = JsonExtractor(url: self.url)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

