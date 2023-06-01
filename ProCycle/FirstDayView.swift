//
//  FirstDayView.swift
//  ProCycle
//
//  Created by Joana Lima on 01/06/23.
//

import SwiftUI

struct FirstDayView: View {
    
    var window = NSScreen.main?.visibleFrame
    
    @State private var date = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        
        ZStack{
            Color.purple
                .ignoresSafeArea()
    
            VStack{
                
                Text("Qual o primeiro dia da sua última menstruação?")
                    .font(.system(size: window!.width / 50, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: window!.width / 2, height: window!.height / 6)
                
                VStack(alignment: .center){
                    
                    DatePicker("", selection: $date, in: ...Date(), displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .padding(.leading)
                    
                    
                    
                    Text("Você selecionou: \(date, formatter: dateFormatter)")
                        .font(.system(size: window!.width / 80, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 200)
                }
                
                
                NavigationLink {
                    AboutView() //Mudar essa pra proxima pagina 
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




struct FirstDayView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDayView()
    }
}
