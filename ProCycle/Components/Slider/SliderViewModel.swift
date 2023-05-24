//
//  SliderViewModel.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

class SliderViewModel: ObservableObject {
    @Published var days: [SliderCellModel] = []

    init() {
        firstTimeLoadingData()
    }
    
    func firstTimeLoadingData() {
        for i in stride(from: -100, to: 100, by: 1) {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: Date())!
            days.append(SliderCellModel(phase: .none, day: modifiedDate))
        }
    }

}
