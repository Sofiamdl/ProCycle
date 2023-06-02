//
//  ContentView.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI
import EventKit

struct ContentView: View {
    @State var circleFrame: CGFloat = 220
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cycles: FetchedResults<CycleInfos>
    @ObservedObject var calendar = CalendarViewModel()
    @State var daysAfterMenstruation = "15"
    @State var averageDuration = "5"
    @State var averageCycle = "28"
    @State var startDate = Date.now
    @State var endDate = Date()
    

    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Slider()
                Spacer()
            }
            
                VStack {
                    Spacer()
                    Spacer()
                    HStack (spacing: 70) {
                         Spacer()
                         CircularProgressView(circleFrame: $circleFrame)
                             .onAppear {
                                 let cycleInfo = CycleInfos(context: moc)
                                 cycleInfo.phaseDescription = "a"
                                 cycleInfo.phaseExpandedDescription = "ab"
                                 cycleInfo.phaseName = "c"
                                 try? moc.save()
                             }
                             .padding()
                         VStack (spacing: 8){
                             Text ("Você está na menstruação.")
                                 .font(.system(size: 36, weight: .heavy))
                                 .frame(maxWidth: .infinity, alignment: .leading)
                                 .foregroundColor(CustomColor.rustyRed)
                             Text ("Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e administrativas em geral, e evite a pressão de prazos inflexíveis." + "\n" + "\n" + "Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e administrativas em geral, e evite a pressão de prazos inflexíveis.")
                                 .font(.system(size: 14, weight: .light, design: .rounded))
                                 .frame(maxWidth: .infinity, alignment: .leading)
                                 .foregroundColor(CustomColor.persianIndigo)
                         }
                     }
                    .padding(.trailing, 40)
                    Spacer()
                     
                 }
            .ignoresSafeArea(.all)

        }
        .environmentObject(calendar)
        .background(.white)
            
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
