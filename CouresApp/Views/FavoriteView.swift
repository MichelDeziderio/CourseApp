//
//  FavoriteView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 05/12/24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
       
        ZStack {
            Color("Background").ignoresSafeArea()
            
            Text("FAVORITOS")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
