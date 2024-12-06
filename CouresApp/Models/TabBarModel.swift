//
//  TabBarModel.swift
//  CouresApp
//
//  Created by Michel Deziderio on 04/12/24.
//

import SwiftUI
import SwiftUIFontIcon

class selectedView: ObservableObject {
    @Published var pageView: String = "HOME"
}

struct TabBar: Identifiable {
    var id: String = UUID().uuidString
    var tab: String
    var icon: FontAwesomeCode
}

var tabBarsList: [TabBar] = [
    TabBar( id: "homePage", tab: "HOME", icon: .home),
    TabBar( id: "searchPage", tab: "PESQUISAR", icon: .search ),
    TabBar( id: "favoritePage", tab: "FAVORITOS", icon: .star ),
    TabBar( id: "menuBar", tab: "MENU", icon: .bars ),
]
