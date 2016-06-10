//
//  JSONDataParser.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 07/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//
// http://openweathermap.org/img/w/10d.png

import Foundation

struct ForecastDetails {
  var temperature:Temperatures
  var pressure:Double
  var iconUrl:String
}

struct Temperatures {
  var day:Double
  var min:Double?
  var max:Double?
  var night:Double?
  var evening:Double?
  var morning:Double?
  
  init(day: Double)
  {
    self.day = day
  }
}

protocol JsonParserDelegate:class {
  func dataDidParse(weatherData:Array<ForecastDetails>)
}

class JsonParser:NSObject, JsonDownloaderDelegate {
  //miasto,temperatura,ciśnienie oraz ikona symbolizująca daną prognozę
  var city:String?
  var weatherData:Array<ForecastDetails>?
  var url:String!
  var jsonDwnld:JsonDownloader!
  var numOfDays:Int?
  weak var delegate:JsonParserDelegate?
  
  
  init(url:String) {
    super.init()
    self.url = url
    
    weatherData = []
    jsonDwnld = JsonDownloader()
    jsonDwnld.delegate = self
    jsonDwnld.downloadJsonForUrl(self.url)
  }

  
  func jsonDataDidDownload(jsonData: NSDictionary) {
    
    numOfDays = jsonData["cnt"] as? Int
    city = (jsonData["city"] as? [String:AnyObject])!["name"] as? String
    print(city)
    
    let dailyForecast = jsonData["list"] as? [AnyObject]
    
    for day in dailyForecast! {
      
      
      let pressure = day["pressure"] as? Double
      //print(day)
      let iconCode = (day["weather"] as? [AnyObject])![0]["icon"] as? String
      
      let temperature = Temperatures(day: ((day["temp"] as? [String:AnyObject])!["day"] as? Double)!)
      
      let forecastForOneDay = ForecastDetails(temperature: temperature, pressure:pressure!, iconUrl: makeUrlFromIconCode(iconCode!))
      weatherData?.append(forecastForOneDay)
      
      }
    //print(weatherData)
    delegate?.dataDidParse(weatherData!)
  }
  
  
  func makeUrlFromIconCode(iconCode:String) -> String {
    return "https://openweathermap.org/img/w/\(iconCode).png"
  }
}