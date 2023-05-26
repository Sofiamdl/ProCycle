//
//  SliderCellModel.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import Foundation

enum CyclePhase {
    case folicular
    case menstruation
    case luteal
    case fertile
    case expectedMenstruation
    case none
}

struct SliderCellModel: Hashable {
    var phase: CyclePhase
    var day: Date
    var focus: Bool = false
}
