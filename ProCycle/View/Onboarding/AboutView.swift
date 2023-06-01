//
//  AboutView.swift
//  ProCycle
//
//  Created by Joana Lima on 26/05/23.
//

import SwiftUI

struct AboutView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var window = NSScreen.main?.visibleFrame
    var body: some View {
        ZStack{
            Color.purple
                .ignoresSafeArea()
            VStack{
    
                Text("O que é o ProCycle?")
                    .font(.system(size: window!.width / 50, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    //.frame()
                
                
                Text("Pensando nisso, criamos o ProCycle, um aplicativo de acompanhamento menstrual um pouco diferente. Nele, além de saber as fases do seu ciclo, também é possível obter sugestões de como organizar melhor a sua rotina tendo como base o seu ciclo menstrual.")
                    .font(.system(size: window!.width / 80, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: window!.width / 2, height: window!.height / 6)
                
                Text("Fornecemos informações detalhadas sobre cada uma das quatro fases do seu ciclo (Menstruação, Fase Folicular, Período Fértil e Fase Lútea) com dicas e recomendações de como realizar atividades dos mais variados tipos, desde momento mais propício pra reuniões até tipos de exercícios físicos, além de ser possível marcar e categorizar atividades com integração ao Calendário da Apple.")
                    .font(.system(size: window!.width / 80, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: window!.width / 2, height: window!.height / 6)
                
            
                Button(action: {
                    coordinator.push(.why)
                }, label: {
                  Text("Continuar")
                        .font(.system(size: window!.width / 80, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(14)
                        .background(.white)
                        .cornerRadius(20)
                        .frame(width: window!.width / 3, height: window!.height / 6)
                })
                
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
