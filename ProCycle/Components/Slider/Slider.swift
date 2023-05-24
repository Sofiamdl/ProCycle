//
//  Slider.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct Slider: View {
    @StateObject private var viewModel = SliderViewModel()
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView (.horizontal) {
                LazyHStack (spacing: 20) {
                    ForEach (0 ..< viewModel.days.count, id: \.self) { day in
                        SliderCell(day: viewModel.days[day])
                    }
                }
                .frame(maxWidth:.infinity, maxHeight: 150)
            }
            .frame(maxWidth: 300, maxHeight: 150)
            .onAppear {
                value.scrollTo(100, anchor: .center)
            }
        }
        .background(.black)
        
    }
    
}
