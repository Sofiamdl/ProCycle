//
//  MenstruationView.swift
//  ProCycle
//
//  Created by lrsv on 01/06/23.
//

import SwiftUI

struct MenstruationView: View {
    @State private var question: Int = 1
    @AppStorage("menstruationDuration") private var menstruationDuration = 1
    @AppStorage("cicleDuration") private var cicleDuration = 28
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
            HStack {
                Image(systemName: "chevron.left.circle.fill")
                    .resizable()
                    .font(.system(size: 40, weight: .heavy))
                    .frame(width: 50, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 24))
                    .foregroundColor(CustomColor.persianIndigo)
                    .onTapGesture {
                        if (menstruationDuration > 1) {
                            menstruationDuration = menstruationDuration - 1
                        }
                    }
                Circle()
                    .fill(CustomColor.lightGrey)
                    .frame(width: 100, height: 100)
                    .overlay(
                        VStack {
                            Text("\(menstruationDuration)")
                                .font(.system(size: 40, weight: .heavy))
                                .foregroundColor(CustomColor.persianIndigo)
                            Text(menstruationDuration == 1 ? "DIA" : "DIAS")
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
                        if (menstruationDuration < 31) {
                            menstruationDuration = menstruationDuration + 1
                        }
                    }
            }
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
            HStack {
                Image(systemName: "chevron.left.circle.fill")
                    .resizable()
                    .font(.system(size: 40, weight: .heavy))
                    .frame(width: 50, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 24))
                    .foregroundColor(CustomColor.persianIndigo)
                    .onTapGesture {
                        if (cicleDuration > 1) {
                            cicleDuration = cicleDuration - 1
                        }
                    }
                Circle()
                    .fill(CustomColor.lightGrey)
                    .frame(width: 100, height: 100)
                    .overlay(
                        VStack {
                            Text("\(cicleDuration)")
                                .font(.system(size: 40, weight: .heavy))
                                .foregroundColor(CustomColor.persianIndigo)
                            Text(cicleDuration == 1 ? "DIA" : "DIAS")
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
                        if (cicleDuration < 31) {
                            cicleDuration = cicleDuration + 1
                        }
                    }
            }
            .padding(.bottom, 40)
            NavigationLink {
                ContentView()
            } label: {
                Text("Continuar")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(CustomColor.notWhite)
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
