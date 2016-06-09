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
  func didFinishDownloading(image:UIImage)
}

class ImageDownloader:NSObject {
  
  static var downloadQueue:NSOperationQueue = {
    var queue = NSOperationQueue()
    queue.name = "Download queue"
    queue.maxConcurrentOperationCount = 1
    print("queue")
    return queue
  }()
  
  var image:UIImage?
  weak var delegate:ImageDownloaderDelegate?
  
  func downloadImageWithUrl(url:String) {
    
  }
}
