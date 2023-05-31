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
    case pms
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
        
        /*init(){
         switch phase {
         case .folicular:
         title = "⚡️ Fase folicular"
         self.startDate = startDate
         
         case .menstruation:
         title = "🩸 Menstruação"
         self.startDate = startDate
         
         case .luteal:
         title = "⬛️ Fase lútea"
         self.startDate = startDate
         
         case .fertile:
         title = "💓 Período fertil"
         self.startDate = startDate
         
         case .expectedMenstruation:
         title = "🩸 Menstruação"
         self.startDate = startDate
         
         case .pms:
         title = "😡 TPM"
         self.startDate = startDate
         
         case .none:
         break
         
         }
         }*/
    }
}
