//
//  ContentView.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var calendar = CalendarViewModel()

    var body: some View {
        VStack {
            Slider()
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
