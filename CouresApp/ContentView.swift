//
//  ContentView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 02/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @EnvironmentObject var selectedTab: selectedView
    @EnvironmentObject var view: SelectedDetailView
    
    var body: some View {
        
        ZStack {
            Group {
                switch selectedTab.pageView {
                case "HOME":
                    HomeView()
                case "PESQUISAR":
                    SearchView()
                case "FAVORITOS":
                    FavoriteView()
                default:
                    AcountView()
                }
            }
        }
        .overlay {
            if !view.show {
                TabBarView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let selectedTab: selectedView = {
        let selectedTab = selectedView()
        selectedTab.pageView = "HOME"
        return selectedTab
    }()
    
    static let view: SelectedDetailView = {
        let view = SelectedDetailView()
        view.show = false
        return view
    }()
    
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(selectedTab)
            .environmentObject(view)
    }
}
