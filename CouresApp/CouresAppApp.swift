//
//  CouresAppApp.swift
//  CouresApp
//
//  Created by Michel Deziderio on 02/12/24.
//

import SwiftUI

@main
struct CouresAppApp: App {
    @StateObject var selectedTab = selectedView()
    @StateObject var view = SelectedDetailView()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(selectedTab)
                .environmentObject(view)
        }
    }
}
