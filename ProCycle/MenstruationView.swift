//
//  MenstruationView.swift
//  ProCycle
//
//  Created by lrsv on 01/06/23.
//

import SwiftUI

struct MenstruationView: View {
    
    var window = NSScreen.main?.visibleFrame
    
    @State private var date = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        
        ZStack{
            CustomColor.notWhite
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            
            VStack{
                
                Text("Quantos dias dura a sua menstruação?")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(CustomColor.rustyRed)
                    .multilineTextAlignment(.center)
                    .frame(width: window!.width / 2, height: window!.height / 5)
            
                VStack (spacing: 50){
                    DatePicker("", selection: $date, in: ...Date(), displayedComponents: [.date])
                        .accentColor(CustomColor.persianIndigo)
                                      
                        .datePickerStyle(.compact)
                        .padding(10)
                        .frame(width: 400)
                        .background(CustomColor.lightGrey)
                        .cornerRadius(10)
                    
                    NavigationLink {
                        AboutView() //Mudar essa pra proxima pagina
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
    
}




struct MenstruationView_Previews: PreviewProvider {
    static var previews: some View {
        MenstruationView()
    }
}
