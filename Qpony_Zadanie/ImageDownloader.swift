//
//  ImageDownloader.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 09/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//

import Foundation
import UIKit

protocol ImageDownloaderDelegate:class {
  func imageDownloaderDidFinishDownloading(image:UIImage)
}

class ImageDownloader:NSObject {
  
  //MARK: properties
  
  static var downloadQueue:NSOperationQueue = {
    var queue = NSOperationQueue()
    queue.name = "Download queue"
    queue.maxConcurrentOperationCount = 1
    return queue
  }()
  
  weak var delegate:ImageDownloaderDelegate?
  
  //MARK: methods
  
  func downloadImageWithUrl(url:String) {
    ImageDownloader.downloadQueue.addOperationWithBlock { () -> Void in
      
      let url = NSURL(string: url)
      let data = NSData(contentsOfURL: url!)
      let img = UIImage(data: data!)
      
      //print("finished downloading image")
      
      NSOperationQueue.mainQueue().addOperationWithBlock({
        
        self.delegate?.imageDownloaderDidFinishDownloading(img!)
      })
    }
  }
  
  //MARK: methods for future use
  
  static func pauseDownloading(){
    downloadQueue.suspended = true
  }
  
  static func unPauseDownloading(){
    downloadQueue.suspended = false
  }
  
  static func cancelDownloading(){
    downloadQueue.cancelAllOperations()
  }
}
