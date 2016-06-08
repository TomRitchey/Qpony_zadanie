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

class WeatherCell: UICollectionViewCell {
  @IBOutlet weak var temperaureLabel: UILabel!
  @IBOutlet weak var pressureLabel: UILabel!
  @IBOutlet weak var weatherIcon: UIImage!
  
}

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, JsonParserDelegate {

  var parsedData: JsonParser?
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  let reuseIdentifier = "cell"
  let url = "http://api.openweathermap.org/data/2.5/forecast/daily?id=3088171&mode=json&units=metric&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    parsedData = JsonParser(url: self.url)
    parsedData?.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK: Collection view methods
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if parsedData != nil {
      return (parsedData?.weatherData?.count)!
    }
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! WeatherCell
    
    if parsedData != nil {
      
      cell.temperaureLabel.text = "\(parsedData!.weatherData![indexPath.row].temperature.day)"
    }
    //cell.temperaureLabel.text = "temp"
    cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
    
    return cell
  }

  func dataDidParse(weatherData:Array<ForecastDetails>) {
    self.collectionView.reloadData()
    print(weatherData)
  }
  
}

