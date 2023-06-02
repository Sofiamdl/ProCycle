//
//  ProCycleApp.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

@main
struct ProCycleApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup{
            NavigationStack{
                FirstDayView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                
            }
        }
    }
}
