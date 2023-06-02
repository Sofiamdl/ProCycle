//
//  TestViewModel.swift
//  ProCycle
//
//  Created by sml on 25/05/23.
//

import EventKit
import SwiftUI

class CalendarViewModel: ObservableObject {
    var eventStore = EKEventStore()
    @Published var days: [SliderCellModel] = []
    @Published var events: [EKEvent] = []
    private var calendar: CalendarService
    private var eventService: EventService
    
    init() {
        /// colocar isso em uma tela inicial
        eventStore.requestAccess(to: .event) { success, error in
            print(success)
        }
        ///
        self.calendar = CalendarService(eventStore: eventStore)
        self.eventService = EventService(eventStore: eventStore)
        loadEventsOfCalendar()
    }
    
    func get() {
        
    }
    
    func loadEventsOfCalendar() {
        let monthsBefore = Date(timeIntervalSinceNow: -100*24*3600)
        
        let events = eventService.getEventsByDate(firstDate: monthsBefore, finalDate: Date(), calendar: calendar.calendar)
        let dicEvents = makeDictionaryOfEvents(events: events)
        
        for i in stride(from: -100, to: 0, by: 1) {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: Date())!
            if dicEvents[modifiedDate.formatted(date: .complete, time: .omitted)] != nil {
                if dicEvents[modifiedDate.formatted(date: .complete, time: .omitted)]?.title == "🩸 Menstruação" {
                    days.append(SliderCellModel(phase: .menstruation, day: modifiedDate))
                }
            }
            else {
                days.append(SliderCellModel(phase: .none, day: modifiedDate))
            }
            
        }
        
        for i in stride(from: 0, to: 100, by: 1) {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: Date())!
            days.append(SliderCellModel(phase: .none, day: modifiedDate))
        }
    }
    
    func makeDictionaryOfEvents(events: [EKEvent]) -> [String: EKEvent] {
        var eventsAux = [String: EKEvent]()
        for event in events {
            let eventDays = daysBetween(start: event.startDate, end: event.endDate)
            for day in 0...eventDays {
                let modifiedDate = Calendar.current.date(byAdding: .day, value: day, to: event.startDate)!
                
                eventsAux[modifiedDate.formatted(date: .complete, time: .omitted)] = event
            }
        }
        return eventsAux
        
    }
    
    func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
    func firstLoadElementsToCalendar(daysBefore: Int, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        let firstDayMenstruation = Calendar.current.date(byAdding: .day, value: -daysBefore, to: Date())!
        addCyclePhasesToCalendar(calendar: calendar.calendar, firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration)
    }
    
    func calculateFutureEvents(menstruationDate: Date) {
        let monthsBefore = Date(timeIntervalSinceNow: -100*24*3600)
        let events = eventService.getEventsByDate(firstDate: monthsBefore, finalDate: menstruationDate, calendar: calendar.calendar)
        return
    }
    
    func adjustEventsInCalendarBy(menstruationDate: Date) {
        eventService.removeElementsInCalendarBy(menstruationDate: menstruationDate, calendar: calendar.calendar!)
    }
    
    func createEvent(title: String, startDate: Date, endDate: Date) {
        eventService.createEvent(title: title, startDate: startDate, endDate: endDate, calendar: calendar.calendar!)
    }
    
    func addCyclePhasesToCalendar(calendar: EKCalendar?, firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        let monthCycleService = MonthCycleService(eventStore: eventStore,
                                                  firstDayMenstruation: firstDayMenstruation,
                                                  averageMenstruationDuration: averageMenstruationDuration,
                                                  averageCycleDuration: averageCycleDuration)
        let phases = monthCycleService.getPhases()
        for (title, startDate, endDate) in phases {
            createEvent(title: title, startDate: startDate, endDate: endDate)
        }
        
    }
    
    func getPhaseFromDate(startDate: Date) -> String {
        let monthsBefore = Date(timeIntervalSinceNow: -100*24*3600)
        let events = eventService.getEventsByDate(firstDate: startDate, finalDate: startDate, calendar: calendar.calendar)
        return events.first?.title ?? ""
    }
    
    func logic(eventTag: Tag, startDate: Date) {
        let phase = getPhaseFromDate(startDate: startDate)
        handleEntertainmentLogic(startDate: startDate, phase: phase)
        
    }
    
    func handleEntertainmentLogic(startDate: Date, phase: String) {
        var suggestions: [Date] = []
        if (phase == "🩸 Menstruação") {
            // cria e retorna
        }
        
        // cria e adiciona na lista uma sugestão do evento na fase lutea:
        
        // pegar o calendario dos proximos 28 dias
        let events = eventService.getEventsByDate(firstDate: startDate, finalDate: startDate.advanced(by: 28*24*3600), calendar: calendar.calendar)
        let dicEvents = makeDictionaryOfEvents(events: events)
        
        // ver o periodo, nesse calendario, em que a pessoa está na fase lutea
        let newFaveDays = dicEvents.filter({$0.value.title == "⬛️ Fase lútea"})
        
        // adicionar na tabela a sugestão do evento no primeiro dia dessa fase
        suggestions.append(Date(from: newFaveDays.first!.key as! Decoder))
        
        
        // cria e adiciona na lista uma sugestão do evento na fase folicular
        // cria e adiciona na lista uma sugestão do evento na fase fertil
        
        
    }
    
    
}
