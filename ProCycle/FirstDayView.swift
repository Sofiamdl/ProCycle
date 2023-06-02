//
//  FirstDayView.swift
//  ProCycle
//
//  Created by Joana Lima on 01/06/23.
//

import SwiftUI
import EventKit

struct FirstDayView: View {
    
    var window = NSScreen.main?.visibleFrame
    
    @State private var date = Date()
    @AppStorage("date") private var initialDate = 0
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    init() {

        let eventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { success, error in
            print(success)
        }
    }
    
    var body: some View {
        
        ZStack{
            CustomColor.notWhite
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            
            VStack{
                
                Text("Qual o primeiro dia da sua última menstruação?")
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
                        // daysbetween
                        
                        MenstruationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Continuar")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(CustomColor.notWhite)
                    }
                    .buttonStyle(.borderless)
                    .padding(14)
                    .background(CustomColor.persianIndigo)
                    .cornerRadius(20)
                }
                
            }
        }
    }
    
}




struct FirstDayView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDayView()
    }
}
