//
//  WeatherCell.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 11/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UICollectionViewCell {
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet private weak var temperaureLabel: UILabel!
  @IBOutlet private weak var pressureLabel: UILabel!
  @IBOutlet weak var weatherIcon: UIImageView!
  weak var colletionViewReference:UICollectionView?
  var weatherImageDodownloader:ImageDownloader!
  var weatherImage:UIImage?
  var imageUrl:String?
  private var myContext = 0
  
  //MARK: methods
  override init(frame: CGRect) { //for programmatically created cells
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func setDayOfTheWeek(numOfDaysFromToday:Int) {
    dayLabel.text = DayOfTheWeek.returnDayName(numOfDaysFromToday)
  }
  
  func setTemperature(temp:Int){
    temperaureLabel.text = "\(temp)°C"
  }
  
  func setPressure(press:Int){
    pressureLabel.text = "\(press) hPa"
  }
  
  func setImage(image:UIImage?){
    weatherIcon.contentMode = UIViewContentMode.ScaleAspectFit
    guard let img = image else {
      return
    }
    weatherIcon.image = img
  }

}