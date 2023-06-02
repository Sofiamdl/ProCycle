//
//  ContentView.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var circleFrame: CGFloat = 450
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject private var coordinator: Coordinator
    @FetchRequest(sortDescriptors: []) var cycles: FetchedResults<CycleInfos>
    @ObservedObject var calendar = CalendarViewModel()
    @State var daysAfterMenstruation = "15"
    @State var averageDuration = "5"
    @State var averageCycle = "28"
    @State var startDate = Date.now
    @State var endDate = Date()
    var body: some View {
        VStack {
            Slider()
            VStack {
<<<<<<< Updated upstream
                CircularProgressView(circleFrame: $circleFrame)
                    .onAppear {
                    let cycleInfo = CycleInfos(context: moc)
                    cycleInfo.phaseDescription = "a"
                    cycleInfo.phaseExpandedDescription = "ab"
                    cycleInfo.phaseName = "c"
                    try? moc.save()
=======
                Slider()
                Spacer()
                
            }
                VStack {
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
                                 .foregroundColor(.red)
                                 .frame(maxWidth: .infinity, alignment: .leading)
                             Text ("Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e administrativas em geral, e evite a pressão de prazos inflexíveis." + "\n" + "\n" + "Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e administrativas em geral, e evite a pressão de prazos inflexíveis.")
                                 .font(.system(size: 14, weight: .light, design: .rounded))
                                 .frame(maxWidth: .infinity, alignment: .leading)
                                 .foregroundColor(CustomColor.persianIndigo)
                         }
                     }
                    Button("botao") {
                        coordinator.push(.createEvent)
                    }
                     
                 }
>>>>>>> Stashed changes

                    
                }
                TextField ("dias que fazem da ultima", text: $daysAfterMenstruation)
                    .padding()
                TextField ("duração media", text: $averageDuration)
                    .padding()
                TextField ("duraçao do ciclo", text: $averageCycle)
                    .padding()
            }
            Button("criar evento", action: {
//                startDate -= Double(daysAfterMenstruation)!*24*3600
//                endDate = startDate + Double(averageDuration)!*24*3600
//                calendar.createEvent(title: "", startDate: startDate, endDate:endDate)
                calendar.firstLoadElementsToCalendar(daysBefore: Int(daysAfterMenstruation)!, averageMenstruationDuration: Int(averageDuration)!, averageCycleDuration: Int(averageCycle)!)
            })
        }
        .environmentObject(calendar)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
