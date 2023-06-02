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
    @State var daysAfterMenstruation = 3
    @State var averageDuration = 6
    @State var averageCycle = 28
    @State var startDate = Date.now
    @State var endDate = Date()
    
    @AppStorage("initialDate") private var initialDate = 0
    @AppStorage("menstruationDuration") private var menstruationDuration = 1
    @AppStorage("cicleDuration") private var cicleDuration = 28
    

    init() {
        print(initialDate)
        print(menstruationDuration)
        print(cicleDuration)
        calendar.firstLoadElementsToCalendar(daysBefore: daysAfterMenstruation, averageMenstruationDuration: averageDuration, averageCycleDuration: averageCycle)
    }
    
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
                             if (initialDate < cicleDuration/4) {
                                 Text ("Você está na menstruação.")
                                     .font(.system(size: 36, weight: .heavy))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.rustyRed)
                                 Text ("Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e administrativas em geral, e evite a pressão de prazos inflexíveis." + "\n" + "\n" + "Níveis mais baixos de energia, capacidade de concentração e produtividade. Reduza tarefas de trabalho e administrativas em geral, e evite a pressão de prazos inflexíveis.")
                                     .font(.system(size: 14, weight: .light, design: .rounded))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.persianIndigo)
                             } else if (initialDate < 2 * (cicleDuration/4) ) {
                                 Text ("Você está no período folicular.")
                                     .font(.system(size: 36, weight: .heavy))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.rustyRed)
                                 Text ("Níveis de energia mais elevados durante essa fase. Bom momento para aprender coisas novas, concluir trabalhos criativos e iniciar novos projetos, graças a uma maior tendência à proatividade. Sua mente está mais aberta à realização de tarefas  complexas, por isso é uma boa ideia agendar reuniões e trabalhos mais intensos.  Momento muito propício para atividades cognitivas, como estudos e trabalho. Invista em projetos mais complexos sem medo. Bom momento do ciclo para exercícios físicos de maior impacto. Dica: uma rotina regular de exercícios é um grande aliado na diminuição de sintomas menstruais! No que diz respeito a atividades físicas, é recomendado aumentar a intensidade nas cargas e no cardio, como corrida.")
                                     .font(.system(size: 14, weight: .light, design: .rounded))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.persianIndigo)
                             } else if (initialDate < 3 * (cicleDuration/4)) {
                                 Text ("Você está no período fértil.")
                                     .font(.system(size: 36, weight: .heavy))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.rustyRed)
                                 Text ("Esse é o momento em que você costuma sentir mais energia, confiança e extroversão. É importante aproveitar esse período para organizar e colocar em prática as atividades que são importantes para você: uma reunião indispensável, um compromisso em que você precise se locomover ou aquela conversa mais difícil com uma pessoa próxima. É um boa oportunidade de aumentar o foco e progredir em seus exercícios e atividades físicas: progressão de carga, treinos de força máxima e treinos metabólicos são bem vindos. Use esse tempo para praticar seus hobbies e atividades que te entretenham. Por ser um momento de alta fertilidade, lembre-se dos métodos contraceptivos!")
                                     .font(.system(size: 14, weight: .light, design: .rounded))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.persianIndigo)
                             } else {
                                 Text ("Você está na fase lútea.")
                                     .font(.system(size: 36, weight: .heavy))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.rustyRed)
                                 Text ("Sua mente pode começar a ficar lenta em comparação às semanas anteriores. É possível que você comece a notar uma queda significativa na sua produtividade. Síndrome Pré Menstrual, conhecida por TPM, também pode aparecer nos dias dessa fase do ciclo. Use sua sensibilidade a seu favor: bom momento para atividades de autorreflexão e organização pessoal: da casa, do quarto, da agenda. É aconselhável evitar compromissos sociais intensos nos momentos que se aproximam da sua menstruação, já que suas emoções podem estar mais afloradas. Bom momento também para colocar as atividades de lazer em dia: atualize-se nas suas séries e assista a seus filmes preferidos. No que diz respeito a atividades físicas, é recomendado começar a dosar a intensidade, focar em mobilidade, alongamentos, trabalhar mais o core e focar em exercícios de menor impacto.")
                                     .font(.system(size: 14, weight: .light, design: .rounded))
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                     .foregroundColor(CustomColor.persianIndigo)
                             }

                         }
                     }
                    .padding(.trailing, 40)
                    Spacer()
                     
                 }
            .ignoresSafeArea(.all)

        }
        .alert("Você só pode marcar em dias que já passaram", isPresented: $calendar.showingAlert) {
                    Button("OK", role: .cancel) { }
                }
        .environmentObject(calendar)
        .background(.white)
        .onAppear() {
            calendar.days = []
            calendar.loadEventsOfCalendar()
        }
    
            
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
