//
//  SliderCell.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct SliderCell: View {
    @State var day: SliderCellModel
    @StateObject private var viewModel = SliderCellViewModel()
    @EnvironmentObject var calendar: CalendarViewModel

    var body: some View {
        VStack {
            Text(viewModel.getDayOfTheWeek(date: day.day))
            ZStack (alignment: .top) {
                Capsule()
                    .fill(.white)
                    .frame(width: 52, height: 100)
                Circle()
                    .fill(day.phase == .menstruation ? .red : .white)
                    .frame(width: 44, height: 44)
                    .padding(.top, 6)
            }
            .frame(height: 100)
            .onTapGesture  {
                if day.phase == .menstruation {
                    day.phase = .none
                } else {
                    day.phase = .menstruation
                }
                calendar.adjustCalendar(menstruationDate: day.day)
                
            }
            Text(viewModel.getDate(date: day.day))
        }
        .frame(height: 100)

    }
    
}
