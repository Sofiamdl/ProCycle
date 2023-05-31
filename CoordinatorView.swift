//
//  CoordinatorView.swift
//  ProCycle
//
//  Created by Joana Lima on 31/05/23.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) { coordinator.build(page: .intro)
                .navigationDestination(for: Page.self){ page in
                    coordinator.build(page: page)
                    
                }
        }
        .environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
