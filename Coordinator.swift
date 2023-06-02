//
//  Coordinator.swift
//  ProCycle
//
//  Created by Joana Lima on 31/05/23.
//

import SwiftUI

enum Page: String, Identifiable{
    case intro, about, why, createEvent, home
    
    var id: String{
        self.rawValue
    }
}

class Coordinator: ObservableObject{
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page){
        path.append(page)
    }
    
    func pop(){
        path.removeLast()
    }
    
    func popToRoot(){
        path.removeLast(path.count)
    }
    
    
    
    @ViewBuilder
    func build(page: Page) -> some View{
        switch page {
        case .intro:
            IntroView()
            
        case .about:
            AboutView()
            
        case .why:
            WhyView()
            
        case .createEvent:
            CreateEventView()
            
        case .home:
            ContentView()
        }
    }
    
}
