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

class WeatherCell: UICollectionViewCell, ImageDownloaderDelegate {
  //MARK: properties
  @IBOutlet private weak var temperaureLabel: UILabel!
  @IBOutlet private weak var pressureLabel: UILabel!
  @IBOutlet weak var weatherIcon: UIImageView!
  weak var colletionViewReference:UICollectionView?
  var weatherImageDodownloader:ImageDownloader!
  private var myContext = 0
  
  //MARK: methods
  override init(frame: CGRect) { //for programmatically created cells
    super.init(frame: frame)
    weatherImageDodownloader = ImageDownloader()
    weatherImageDodownloader.delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    weatherImageDodownloader = ImageDownloader()
    weatherImageDodownloader.delegate = self
  }
  
  func setTemperature(temp:Int){
    temperaureLabel.text = "\(temp) °C"
  }
  
  func setPressure(press:Int){
    pressureLabel.text = "\(press) hPa"
  }
  
  func setWeatherImageUrl(url:String){
    weatherImageDodownloader.downloadImageWithUrl(url)
  }
  
  func imageDownloaderDidFinishDownloading(image:UIImage) {
    weatherIcon.image = image
    weatherIcon.contentMode = UIViewContentMode.ScaleAspectFit
    
  }
}

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, JsonParserDelegate {
//MARK: properties
  var parsedData: JsonParser?
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  @IBOutlet weak var cityLabel: UILabel!
  
  let reuseIdentifier = "cell"
  let url = "http://api.openweathermap.org/data/2.5/forecast/daily?id=3088171&mode=json&units=metric&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
  
  //MARK: methods
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
    return 2
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! WeatherCell
    //print(parsedData)
    
    cell.colletionViewReference = collectionView
    
    if parsedData == nil {
    
      cell.temperaureLabel.text = "temp"
    } else {
      cell.setTemperature(Int(parsedData!.weatherData![indexPath.row].temperature.day))
      cell.setPressure(Int(parsedData!.weatherData![indexPath.row].pressure))
      cell.setWeatherImageUrl(parsedData!.weatherData![indexPath.row].iconUrl)
    }
    cell.backgroundColor = UIColor.grayColor()
    return cell
  }

  func dataDidParse(weatherData:Array<ForecastDetails>) {
    self.collectionView.reloadData()
    cityLabel.text = parsedData?.city
  }
  
}

