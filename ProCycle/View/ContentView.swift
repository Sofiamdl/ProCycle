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
    @FetchRequest(sortDescriptors: []) var cycles: FetchedResults<CycleInfos>
    
    var body: some View {
        HStack {
            VStack {
                
                CircularProgressView(circleFrame: $circleFrame)
                Button("ADD"){
                    let cycleInfo = CycleInfos(context: moc)
                    cycleInfo.phaseDescription = "a"
                    cycleInfo.phaseExpandedDescription = "ab"
                    cycleInfo.phaseName = "c"
                    try? moc.save()

                    
                }
                
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
