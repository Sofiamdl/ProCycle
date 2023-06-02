//
//  IntroView.swift
//  ProCycle
//
//  Created by Joana Lima on 26/05/23.
//

import SwiftUI


struct IntroView: View {
    
    
    //Getting window size
    var window = NSScreen.main?.visibleFrame
    var body: some View {
        ZStack{
            
            CustomColor.notWhite
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack (spacing: 10){
                
                Text("Olá!!")
                    .font(.system(size: 72, weight: .bold, design: .default))
                    .foregroundColor(CustomColor.rustyRed)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: -40){
                    Text("Como uma pessoa que menstrua, você provavelmente sabe que o ciclo menstrual afeta diretamente nossas vidas. As alterações hormonais que ocorrem durante a menstruação também podem desempenhar um papel de impacto em nossa produtividade. Os níveis de hormônios, como o estrogênio e a progesterona, flutuam durante esse período. Esses fatores geralmente afetam o humor e a energia, causando sentimento de  cansaço, irritação ou sensibilidade emocional, o que pode interferir na nossa capacidade de se concentrar e realizar as tarefas de forma eficiente.")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .foregroundColor(CustomColor.persianIndigo)
                        .multilineTextAlignment(.center)
                        .frame(width: window!.width / 2, height: window!.height / 5)
                    
                    Text("Ainda que nem todas as mulheres experienciem os mesmos sintomas ou tenham sua produtividade afetada de forma significativa durante seu ciclo menstrual, é preciso estar atenta a esses sintomas para que seu efeito sobre a produtividade possa ser minimizado. Uma ótima estratégia é ter autoconhecimento sobre seu ciclo e os sintomas associados pois isso pode nos ajudar a ajustar nossas rotinas da melhor forma possível.")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .foregroundColor(CustomColor.persianIndigo)
                        .multilineTextAlignment(.center)
                        .frame(width: window!.width / 2, height: window!.height / 4)
                }
                

                NavigationLink {
                                    AboutView()
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




struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
