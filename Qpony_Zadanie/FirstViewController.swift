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

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, JsonParserDelegate, UIDocumentInteractionControllerDelegate, ImageDownloaderDelegate {
//MARK: properties
  var parsedData: JsonParser?
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  @IBOutlet weak var cityLabel: UILabel!
  
  var weatherImage:Array<UIImage?>?
  var weatherImageDodownloader:ImageDownloader!
  
  let reuseIdentifier = "cell"
  let url = "http://api.openweathermap.org/data/2.5/forecast/daily?id=3088171&mode=json&units=metric&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
  
  //MARK: methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    weatherImageDodownloader = ImageDownloader()
    weatherImageDodownloader.delegate = self
    
    parsedData = JsonParser(url: self.url)
    parsedData?.delegate = self
    collectionView.backgroundColor = UIColor.whiteColor()
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
    
    cell.colletionViewReference = collectionView
    
    cell.backgroundColor = UIColor.lightGrayColor()
    cell.layer.masksToBounds = true
    cell.layer.cornerRadius = 5
    cell.setImage(weatherImage?[indexPath.row])
    cell.setDayOfTheWeek(indexPath.row)
    
    guard let data = parsedData else {
      cell.setTemperature(-1)
      return cell
    }
    
    cell.setTemperature(Int(data.weatherData![indexPath.row].temperature.day))
    cell.setPressure(Int(data.weatherData![indexPath.row].pressure))
    
    return cell
  }

  func dataDidParse(weatherData:Array<ForecastDetails>) {
    weatherImage = Array(count: (parsedData?.numOfDays)!,repeatedValue: nil)
    
    for index in 0..<weatherImage!.count {
      weatherImageDodownloader.downloadImageWithUrl((parsedData!.weatherData![index].iconUrl), forIndex:index)
    }
    
      self.collectionView.reloadData()
    cityLabel.text = parsedData?.city
  }
  
  func imageDownloaderDidFinishDownloading(image:UIImage, imageIndex:Int) {
    weatherImage!.insert(image, atIndex: imageIndex)
    collectionView.reloadData()
  }
}

