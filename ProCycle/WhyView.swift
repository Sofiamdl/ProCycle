//
//  WhyView.swift
//  ProCycle
//
//  Created by Joana Lima on 26/05/23.
//

import SwiftUI

struct WhyView: View {
    
    
    var window = NSScreen.main?.visibleFrame
    var body: some View {
        ZStack{
            Color.purple
                .ignoresSafeArea()
            
            VStack(spacing: 40){
    
                Text("Por que usamos o calendar?")
                    .font(.system(size: window!.width / 50, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                
                Text("Para que seja possível fazer a integração com o Calendário da Apple, precisamos ter acesso a ele. Ao nos fornecer esse acesso, todas as atividades que você criar e as fases do seu ciclo menstrual estarão visíveis no Calendário automaticamente.")
                    .font(.system(size: window!.width / 80, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: window!.width / 2, height: window!.height / 6)
                
            
                NavigationLink {
                                    FirstDayView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    Text("Continuar")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(.black)
                                }.buttonStyle(.borderless)
                                .padding(14)
                                .background(.white)
                                .cornerRadius(20)
                
            }
        }
    }
}

struct WhyView_Previews: PreviewProvider {
    static var previews: some View {
        WhyView()
    }
}
