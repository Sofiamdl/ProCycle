//
//  SliderCellModel.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import Foundation

enum CyclePhase: String {
    case folicular = "⚡️ Fase folicular"
    case menstruation = "🩸 Menstruação"
    case luteal  = "⬛️ Fase lútea"
    case fertile =  "💓 Período fertil"
    case expectedMenstruation = "Menstruação Prevista"
    case none = "none"
    case pms = "😡 TPM"
}

struct SliderCellModel: Hashable {
    var phase: CyclePhase
    var day: Date
    var focus: Bool = false
}

extension ContentView {
    struct EventPhases: Hashable{
        var phase: CyclePhase
        var title: String
        var startDate: Date
        var endDate: Date
        var description: String
        }
}
