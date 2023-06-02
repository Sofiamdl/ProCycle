//
//  MenstruationView.swift
//  ProCycle
//
//  Created by lrsv on 01/06/23.
//

import SwiftUI

struct MenstruationView: View {
    @State private var question: Int = 1
    @AppStorage("menstruationDuration") private var menstruationDuration = 0

    var body: some View {
        ZStack{
            CustomColor.notWhite
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                if (question == 1) {
                    questionOne
                } else {
                    questionTwo
                }
            }
        }
    }
    
    var questionOne: some View {
        VStack {
            Text("Quantos dias dura a sua menstruação?")
                .font(.system(size: 40, weight: .bold, design: .default))
                .foregroundColor(CustomColor.rustyRed)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 182, bottom: 40, trailing: 182))
            DayStepperView(day: 5)
                .padding(.bottom, 40)
            Text("Continuar")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(CustomColor.notWhite)
                .buttonStyle(.borderless)
                .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                .background(CustomColor.persianIndigo)
                .cornerRadius(12)
                .onTapGesture {
                    question = 2
                }
            
        }
    }
    
    var questionTwo: some View {
        VStack {
            Text("Quanto tempo dura o seu ciclo menstrual?")
                .font(.system(size: 40, weight: .bold, design: .default))
                .foregroundColor(CustomColor.rustyRed)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 182, bottom: 40, trailing: 182))
            DayStepperView(day: 28)
                .padding(.bottom, 40)
            NavigationLink {
                ContentView()
            } label: {
                Text("Continuar")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(CustomColor.notWhite)
            }
            .onTapGesture {
                menstruationDuration = question
            }
            .buttonStyle(.borderless)
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
            .background(CustomColor.persianIndigo)
            .cornerRadius(12)
            
        }
    }
}




struct MenstruationView_Previews: PreviewProvider {
    static var previews: some View {
        MenstruationView()
    }
}
