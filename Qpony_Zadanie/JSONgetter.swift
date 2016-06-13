//
//  JSONgetter.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 06/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//

import Foundation

protocol JsonDownloaderDelegate:class {
  func jsonDataDidDownload(jsonData: NSDictionary)
}

class JsonDownloader: NSObject, NSURLConnectionDelegate {

  var data = NSMutableData()
  var jsonData: NSDictionary!
  weak var delegate:JsonDownloaderDelegate?
  
  override init() {
    super.init()
  }
  
  func downloadJsonForUrl(url:String){
    let url: NSURL = NSURL(string: url)!
    let request: NSURLRequest = NSURLRequest(URL: url)
    let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
    connection.start()
  }
  
  func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
    self.data.appendData(data)
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection!) {
    do {
    jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
    }catch{
      print("json error")
    }
    delegate?.jsonDataDidDownload(jsonData)
  }
  
  func startConnection(){
    let urlPath: String = "http://api.openweathermap.org/data/2.5/forecast/daily?id=3088171&mode=json&units=metric&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
    let url: NSURL = NSURL(string: urlPath)!
    let request: NSURLRequest = NSURLRequest(URL: url)
    let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
    connection.start()
  }

}