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
    @Published var events: [EKEvent] = []
    @Published var calendar: EKCalendar?

    init() {
        requestAccessToCalendar()
        self.calendar = addCalendar()
    }

    func requestAccessToCalendar() {
        eventStore.requestAccess(to: .event) { success, error in
            print(success)
        }
    }

    func bestPossibleEKSource() -> EKSource? {
        let `default` = eventStore.defaultCalendarForNewEvents?.source
        let iCloud = eventStore.sources.first(where: { $0.title == "iCloud" }) // this is fragile, user can rename the source
        let local = eventStore.sources.first(where: { $0.sourceType == .local })
        return `default` ?? iCloud ?? local
    }

    func addCalendar() -> EKCalendar {
        let calendar = EKCalendar(for: .event, eventStore: self.eventStore)
            calendar.title = "Cicle"
        guard let source = self.bestPossibleEKSource() else {
               return EKCalendar()
           }
           calendar.source = source
        try! self.eventStore.saveCalendar(calendar, commit: true)
        return calendar
    }

    func adjustCalendar(menstruationDate: Date) {
        if let calendar = self.calendar {
            let monthsAfter = Date(timeIntervalSinceNow: 100*24*3600)
            
            let predicate =  eventStore.predicateForEvents(withStart: menstruationDate, end: monthsAfter, calendars: [calendar])
            let events = eventStore.events(matching: predicate)
            
            for event in events {
                print(event)
            }
        }
    }

    func todaysEvents() {
        DispatchQueue.main.async {
            let newEvent = EKEvent(eventStore: self.eventStore)
            newEvent.title = "PFV só testando ele dnv"
            newEvent.startDate = Date()
            newEvent.endDate = Date()
            newEvent.calendar = self.calendar
            
            do {
                try self.eventStore.save(newEvent, span: .thisEvent)
              } catch let error as NSError {
                  print("failed to save event with error : \(error)")
              }
            
        }
    }
}
