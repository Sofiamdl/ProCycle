//
//  ProgressViewCircle.swift
//  ProCycle
//
//  Created by mvitoriapereirac on 24/05/23.
//

import Foundation
import SwiftUI

struct CircularProgressView: View {
    @ObservedObject var viewModel = ProgressCircleViewModel()
    @Binding var circleFrame: CGFloat
//    @Binding var lineWidth: CGFloat
    
    
    
    var progress = 0.4
    @State var moveOnPath = true
    
    var body: some View {
        
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.90)
                .stroke(
                    CustomColor.persianIndigo,
                    style: StrokeStyle(lineWidth: circleFrame/10,
                                       lineCap: .round,
                                       lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))

            Circle()
                .trim(from: 0.0, to: 0.20)
                .stroke(
                    CustomColor.rustyRed,
                    style: StrokeStyle(lineWidth: circleFrame/10,
                                       lineCap: .round,
                                       lineJoin: .round))
                

                .rotationEffect((Angle(degrees: 270)))
            Circle()
                .trim(from: 0.50, to: 0.70)
                .stroke(
                    CustomColor.brightBlue,
                    style: StrokeStyle(lineWidth: circleFrame/10,
                                       lineCap: .round,
                                       lineJoin: .round))
                

                .rotationEffect((Angle(degrees: 270)))
                .overlay(
                    ZStack {
                        Circle()
                            .frame(width: circleFrame/1.5)
                            .foregroundColor(CustomColor.lightGrey)
//                        Text(viewModel.getDate())
//                            .foregroundColor(Color.indigo)
//                            .font(.title2)
                        VStack {
                        
                            
                        Text("DIA")
                                .foregroundColor(CustomColor.persianIndigo)
                                .font(.system(size:12))
                        //add o dia do ciclo aqui!!!!!!
                        Text("02")
                            .foregroundColor(CustomColor.persianIndigo)
                            .font(.system(size:40,weight: .heavy))
                        }
//                        CircleText(radius: circleFrame/2, text: "Período menstrual")
//                            .rotationEffect((Angle(degrees: 30)))
//                            .offset(x: (circleFrame/10)/8, y: -(circleFrame/10)/4)
//
//                        CircleText(radius: circleFrame/2, text: "Período fértil")
//                            .rotationEffect((Angle(degrees: 180)))
//                            .offset(x: -(circleFrame/10)/8, y: (circleFrame/10)/4)
//
//                        CircleText(radius: circleFrame/2, text: "Fase lútea")
//                            .rotationEffect((Angle(degrees: 300)))
//                            .offset(x: -(circleFrame/10)/8, y: -(circleFrame/10)/4)
//
                        Circle()
                            .frame(width: circleFrame/5.5)
                            .foregroundColor(Color.white)
                            .offset(x: 0, y: -(circleFrame/2))
                            .rotationEffect(.degrees(viewModel.accumulatedDegrees))
                        
                          
                        


                    }
                    
                )
        }
        .frame(width: circleFrame, height: circleFrame)
        .padding()
    }
}


