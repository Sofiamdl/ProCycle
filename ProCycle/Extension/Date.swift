//
//  Date.swift
//  ProCycle
//
//  Created by sml on 31/05/23.
//

import SwiftUI

extension Date {
    func daysBetween(_ endDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: endDate).day!
    }
    
    func daysBefore(_ numberOfDays: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -numberOfDays, to: self)!
    }
    
    func daysAfter(_ numberOfDays: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: numberOfDays, to: self)!
    }
    
}
