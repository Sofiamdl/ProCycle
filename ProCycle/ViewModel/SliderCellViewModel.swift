//
//  SliderCellViewModel.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

class SliderCellViewModel: ObservableObject {
    let daysOfTheWeek = ["D", "S", "T", "Q", "Q", "S", "S"]
    
    func getDate(date: Date)-> String{
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.medium
        df.timeStyle = DateFormatter.Style.medium
        let date = (df.string(from: date))

        return String(date.prefix(6))
    }
    
    func getDayOfTheWeek(date: Date) -> String {
        return daysOfTheWeek[Calendar.current.dateComponents([.weekday], from: date).weekday! - 1]
       
    }

}
