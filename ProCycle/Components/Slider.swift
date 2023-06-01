//
//  Slider.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct Slider: View {
    @State private var scrollPosition: CGPoint = .zero
    @EnvironmentObject var calendar: CalendarViewModel

    var body: some View {
        ScrollViewReader { value in
            ScrollView (.horizontal, showsIndicators: false) {
                LazyHStack (spacing: 20) {
                    ForEach (0 ..< calendar.days.count, id: \.self) { day in
                        SliderCell(day: calendar.days[day])
                    }
                }
                .frame(maxWidth:.infinity, maxHeight: 150)
                .background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.scrollPosition = value
//                    print(scrollPosition)
                }
            }
            .frame(maxHeight: 150)
            .onAppear {
                value.scrollTo(100, anchor: .center)
            }
            .coordinateSpace(name: "scroll")
            .onTapGesture {
//                calendar.todaysEvents()
            }
        }
        .background(CustomColor.persianIndigo)
        
    }
    
}


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
