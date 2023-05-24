//
//  SliderCell.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct SliderCell: View {
    @State var day: SliderCellModel
    
    var body: some View {
        VStack {
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
            .onTapGesture {
                if day.phase == .menstruation {
                    day.phase = .none
                } else {
                    day.phase = .menstruation
                }
                
            }
            Text(getDate())
        }
        .frame(height: 100)

    }
    
    func getDate()-> String{
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.medium
        df.timeStyle = DateFormatter.Style.medium
        let date = (df.string(from: day.day))

        return String(date.prefix(6))
    }
    
}
