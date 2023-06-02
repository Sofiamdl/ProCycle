//
//  MenstruationDayView.swift
//  ProCycle
//
//  Created by lrsv on 01/06/23.
//

import Foundation
import SwiftUI

struct DayStepperView: View {
    @State var day: Int = 1
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left.circle.fill")
                .resizable()
                .font(.system(size: 40, weight: .heavy))
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 24))
                .foregroundColor(CustomColor.persianIndigo)
                .onTapGesture {
                    if (day > 1) {
                        day = day - 1
                    }
                }
            Circle()
                .fill(CustomColor.lightGrey)
                .frame(width: 100, height: 100)
                .overlay(
                    VStack {
                        Text("\(day)")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(CustomColor.persianIndigo)
                        Text(day == 1 ? "DIA" : "DIAS")
                            .font(.system(size: 12))
                            .foregroundColor(CustomColor.persianIndigo)
                    }
                )
            Image(systemName: "chevron.right.circle.fill")
                .resizable()
                .font(.system(size: 40, weight: .heavy))
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                .foregroundColor(CustomColor.persianIndigo)
                .onTapGesture {
                    if (day < 31) {
                        day = day + 1
                    }
                }
        }
    }
    
    struct DayStepperView_Previews: PreviewProvider {
        static var previews: some View {
            DayStepperView()
        }
    }
}
