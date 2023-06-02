

//
//  ContentView.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

enum Tag: String, CaseIterable, Identifiable {
    case social, cognitivo, fisico, organizacional, entretenimento
    var id: Self { self }
}



struct CreateEventView: View {
    
    //    newEvent.title = title
    //    newEvent.startDate = startDate
    //    newEvent.endDate = endDate
    //    newEvent.calendar = calendar
    @State private var title: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var selectedTag: Tag = .social
    @EnvironmentObject var calendarViewModel: CalendarViewModel

    var body: some View {
        VStack {
            TextField(
                "Título",
                text: $title
            )
            .disableAutocorrection(true)
            
            DatePicker(
                "Start Date",
                selection: $startDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            
            DatePicker(
                "Final Date",
                selection: $endDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            
            List {
                Picker("Tipo de atividade", selection: $selectedTag) {
                    Text("Reuniões sociais").tag(Tag.social)
                    Text("Estudo").tag(Tag.cognitivo)
                    Text("Trabalho").tag(Tag.cognitivo)
                    Text("Exercício físico").tag(Tag.fisico)
                    Text("Casa").tag(Tag.organizacional)
                    Text("Organização pessoal").tag(Tag.fisico)
                    Text("Entretenimento").tag(Tag.entretenimento)
                }
            }
            
            Button("Pronto") {
                calendar.events
                calendar.createEvent(title: title, startDate: startDate, endDate: endDate)
            }

        }
        .textFieldStyle(.roundedBorder)
    }
    
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
