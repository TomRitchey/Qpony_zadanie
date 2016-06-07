//
//  JSONDataExtractor.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 07/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//
// http://openweathermap.org/img/w/10d.png

import Foundation

class JsonExtractor:NSObject, JsonDownloaderDelegate {
  //miasto,temperatura,ciśnienie oraz ikona symbolizująca daną prognozę
  var city:String?
  var temperature:Array<Int>?
  var pressure:Array<Int>?
  var icon:Array<AnyObject>?
  var url:String!
  var jsonDwnld:JsonDownloader!
  
  init(url:String) {
    super.init()
    self.url = url
    
    jsonDwnld = JsonDownloader()
    jsonDwnld.delegate = self
    jsonDwnld.downloadJsonForUrl(self.url)
  }

  
  func jsonDataDidDownload(jsonData: NSDictionary) {
    
    print("ok")
  }
  
}