//
//  DateTracking.swift
//  ProCycle
//
//  Created by mvitoriapereirac on 24/05/23.
//

import SwiftUI

class DateTrack {
    let date = Date()
    let calendar = Calendar.current

   
    
    func todaysWeekday() -> Int {
        return calendar.component(.month, from: date)

    }
    
    func todaysMonthDay() -> Int {
        return calendar.component(.day, from: date)

    }
    
    func todaysMonth() -> Int {
        return calendar.component(.month, from: date)

    }
    
    func daysOfMonth() -> Int {
        // Calculate start and end of the current year (or month with `.month`):
        let interval = calendar.dateInterval(of: .month, for: date)! //change year it will no of days in a year , change it to month it will give no of days in a current month

        // Compute difference in days:
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        print(days)
        return days

    }
    
    func daysOfYear() -> Int {
        // Calculate start and end of the current year (or month with `.month`):
        let interval = calendar.dateInterval(of: .year, for: date)! //change year it will no of days in a year , change it to month it will give no of days in a current month

        // Compute difference in days:
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        print(days)
        return days

    }
    


}


