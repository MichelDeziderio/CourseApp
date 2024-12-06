//
//  MenuView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 05/12/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            Text("MENU")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
