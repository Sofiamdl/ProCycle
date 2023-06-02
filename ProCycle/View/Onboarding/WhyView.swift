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
            CustomColor.notWhite
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack (spacing: 10){
    
                Text("Por que usamos o calendar?")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(CustomColor.rustyRed)
                    .multilineTextAlignment(.center)
                
                
                Text("Para que seja possível fazer a integração com o Calendário da Apple, precisamos ter acesso a ele. Ao nos fornecer esse acesso, todas as atividades que você criar e as fases do seu ciclo menstrual estarão visíveis no Calendário automaticamente.")
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .foregroundColor(CustomColor.persianIndigo)
                    .multilineTextAlignment(.center)
                    .frame(width: window!.width / 2, height: window!.height / 5)
                
            
                NavigationLink {
                                    FirstDayView()
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

struct WhyView_Previews: PreviewProvider {
    static var previews: some View {
        WhyView()
    }
}
