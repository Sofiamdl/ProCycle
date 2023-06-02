//
//  AboutView.swift
//  ProCycle
//
//  Created by Joana Lima on 26/05/23.
//

import SwiftUI

struct AboutView: View {
    
    
    var window = NSScreen.main?.visibleFrame
    var body: some View {
        ZStack{
            CustomColor.notWhite
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(spacing: 10){
    
                Text("O que é o ProCycle?")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(CustomColor.rustyRed)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: -40){
                    Text("Pensando nisso, criamos o ProCycle, um aplicativo de acompanhamento menstrual um pouco diferente. Nele, além de saber as fases do seu ciclo, também é possível obter sugestões de como organizar melhor a sua rotina tendo como base o seu ciclo menstrual.")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .foregroundColor(CustomColor.persianIndigo)
                        .multilineTextAlignment(.center)
                        .frame(width: window!.width / 2, height: window!.height / 5)
                    
                    Text("Fornecemos informações detalhadas sobre cada uma das quatro fases do seu ciclo (Menstruação, Fase Folicular, Período Fértil e Fase Lútea) com dicas e recomendações de como realizar atividades dos mais variados tipos, desde momento mais propício pra reuniões até tipos de exercícios físicos, além de ser possível marcar e categorizar atividades com integração ao Calendário da Apple.")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .foregroundColor(CustomColor.persianIndigo)
                        .multilineTextAlignment(.center)
                        .frame(width: window!.width / 2, height: window!.height / 5)
                }
                
            
                NavigationLink {
                                    WhyView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    Text("Continuar")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(CustomColor.notWhite)
                                }.buttonStyle(.borderless)
                                .padding(14)
                                .background(CustomColor.persianIndigo)
                                .cornerRadius(20)
                
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
