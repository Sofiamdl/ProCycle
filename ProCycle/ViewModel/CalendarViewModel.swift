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
    @Published var showingAlert = false

    private var calendar: CalendarService
    private var eventService: EventService
    private var calculateCycle: CalculateCycle
    
    init() {
        /// colocar isso em uma tela inicial
        eventStore.requestAccess(to: .event) { success, error in
            print(success)
        }
        ///
        self.calendar = CalendarService(eventStore: eventStore)
        self.eventService = EventService(eventStore: eventStore)
        self.calculateCycle = CalculateCycle()
        loadEventsOfCalendar()
    }
    
    func loadEventsOfCalendar() {
        let monthsBefore = Date().daysBefore(100)
        
        let events = eventService.getEventsByDate(firstDate: monthsBefore, finalDate: Date(), calendar: calendar.calendar)
        let dicEvents = eventService.makeDictionaryOfEvents(events: events)
        
        for i in stride(from: -100, to: 100, by: 1) {
            var type: CyclePhase = .none
            let modifiedDate = Date().daysAfter(i)
            if dicEvents[modifiedDate.formatted(date: .complete, time: .omitted)] != nil {
                if dicEvents[modifiedDate.formatted(date: .complete, time: .omitted)]?.title == CyclePhase.menstruation.rawValue {
                    type = .menstruation
                } else if dicEvents[modifiedDate.formatted(date: .complete, time: .omitted)]?.title == CyclePhase.expectedMenstruation.rawValue {
                    type = .expectedMenstruation
                }
            }
            days.append(SliderCellModel(phase: type, day: modifiedDate))
        }
    }
    
    func firstLoadElementsToCalendar(daysBefore: Int, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        let firstDayMenstruation = Date().daysBefore(daysBefore)
        addCyclePhasesToCalendar(calendar: calendar.calendar, firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration, lastDayMenstruation: nil)
    }
    
    func adjustEventsInCalendarBy(menstruationDate: Date) {
        let eventsBefore = eventService.eventsBefore(daysBefore: 100, finalDate: Date(), calendar: calendar.calendar!)
        let eventsAfter = eventService.eventsAfter(daysAfter: 100, startDate: Date(), calendar: calendar.calendar!)

        var firstDayMenstruation = calculateCycle.getFirstCycleFromLastPeriod(events: eventsBefore)
        var lastDayMenstruation: Date? = nil
        
        let averageMenstruationDuration = calculateCycle.calculateAverageMenstruationDuration(events: eventsBefore)
        let averageCycleDuration = calculateCycle.calculateAverageCycleDuration(eventsBefore: eventsBefore, eventsAfter: eventsAfter)
        
        print("AQ", firstDayMenstruation, averageMenstruationDuration, averageCycleDuration)
        
        let startEndMenstruation = checkClickedMenstruation(menstruationDate: menstruationDate)

        if startEndMenstruation != nil {
            let (first, last) = startEndMenstruation!
            firstDayMenstruation = first
            lastDayMenstruation = last
        }

        eventService.removeElementsInCalendarBy(menstruationDate: menstruationDate, calendar: calendar.calendar!)
        // Mudar so os a partir de hoje, n anteriores
        addCyclePhasesToCalendar(calendar: calendar.calendar, firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration,
                                 lastDayMenstruation: lastDayMenstruation)
        loadEventsOfCalendar()
        
    }
    
    func checkClickedMenstruation(menstruationDate: Date) -> (Date, Date)? {
        let eventsBeforeMenstruationDate = eventService.eventsBefore(daysBefore: 100, finalDate: Date(), calendar: calendar.calendar!)
       
        var eventsToRemove = eventsBeforeMenstruationDate.filter { event in
            return event.title != CyclePhase.menstruation.rawValue
        }

        let eventsOneDayBeforeMenstruation = eventService.eventsBefore(daysBefore: 1, finalDate: menstruationDate, calendar: calendar.calendar!)
        let eventsOneDayAfterMenstruation = eventService.eventsAfter(daysAfter: 1, startDate: menstruationDate, calendar: calendar.calendar!)
        
        var newEventStartDate = menstruationDate
        var newEventEndDate = menstruationDate
        var returnNil = true

        if eventsOneDayBeforeMenstruation.count > 0 {
            let lastIndex = eventsOneDayBeforeMenstruation.count-1
            if eventsOneDayBeforeMenstruation[lastIndex].title == CyclePhase.menstruation.rawValue {
                newEventStartDate = eventsOneDayBeforeMenstruation[lastIndex].startDate
                eventsToRemove.append(eventsOneDayBeforeMenstruation[lastIndex])
                returnNil = false
            }
        }

        if eventsOneDayAfterMenstruation.count > 0 {
            if eventsOneDayAfterMenstruation[0].title == CyclePhase.menstruation.rawValue {
                newEventEndDate = eventsOneDayAfterMenstruation[0].endDate
                eventsToRemove.append(eventsOneDayAfterMenstruation[0])
                returnNil = false

            }
        }

        for event in eventsToRemove {
            eventService.removeEvent(eventId: event.calendarItemIdentifier)
        }
        
        if returnNil == false {
            return (newEventStartDate, newEventEndDate)
        }
        return nil
    }
    
    func createEvent(title: String, startDate: Date, endDate: Date) {
        eventService.createEvent(title: title, startDate: startDate, endDate: endDate, calendar: calendar.calendar!)
    }
    
    func addCyclePhasesToCalendar(calendar: EKCalendar?, firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int, lastDayMenstruation: Date?) {
        var monthCycleService = MonthCycleService(eventStore: eventStore,
                                                  firstDayMenstruation: firstDayMenstruation,
                                                  averageMenstruationDuration: averageMenstruationDuration,
                                                  averageCycleDuration: averageCycleDuration, lastDayMenstruation: lastDayMenstruation)
        let phases = monthCycleService.getPhases()
        for (title, startDate, endDate) in phases {
            createEvent(title: title, startDate: startDate, endDate: endDate)
        }
    }
}
