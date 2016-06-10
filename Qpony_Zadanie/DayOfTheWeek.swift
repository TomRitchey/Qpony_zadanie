//
//  DaysEnum.swift
//  Qpony_Zadanie
//
//  Created by Kacper Augustyniak on 10/06/16.
//  Copyright © 2016 Kacper Augustyniak. All rights reserved.
//

import Foundation

class DayOfTheWeek {
  
  
  class func returnDayName(dayOffset:Int) -> String? {
    let dateFormatter  = NSDateFormatter()
    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let todayDate = NSDate()
    
//    if dayOffset == 0 {
//      return NSLocalizedString("Today", comment: "Today")
//    }
    
    if dayOffset == 0 {
      return NSLocalizedString("Tomorrow", comment: "Tomorrow")
    }
    
    let components = calendar.components(.Weekday, fromDate: todayDate)
    var weekDay = components.weekday
    
    weekDay = ((weekDay + dayOffset - 1)%7)+1
    
    switch weekDay {
      case 1:
        return NSLocalizedString("Sunday", comment: "Sunday")
      case 2:
        return NSLocalizedString("Monday", comment: "Monday")
      case 3:
        return NSLocalizedString("Tuesday", comment: "Sunday")
      case 4:
        return NSLocalizedString("Wednesday", comment: "Wednesday")
      case 5:
        return NSLocalizedString("Thursday", comment: "Thursday")
      case 6:
        return NSLocalizedString("Friday", comment: "Thursday")
      case 7:
        return NSLocalizedString("Saturday", comment: "Saturday")
      default:
        return NSLocalizedString("Day", comment: "Day")
    }

  }
  
}