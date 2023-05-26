//
//  ContentView.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var circleFrame: CGFloat = 450
    var body: some View {
        HStack {
            VStack {
                
                CircularProgressView(circleFrame: $circleFrame)
                
            }
            VStack {
                Text("Fase folicular")
                    .font(.title)
            }

        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
