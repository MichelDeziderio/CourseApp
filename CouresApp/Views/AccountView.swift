//
//  MenuView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 05/12/24.
//

import SwiftUI
import SwiftUIFontIcon

struct AcountView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                
                VStack{
                    HStack{
                        Image("teacher")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(100)
                            .padding(8)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 100, style: .continuous))
                            .shadow(color: .black.opacity(0.14), radius: 10, x: 0, y: 5)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 280, alignment: .center)
                    .padding(.bottom, 30)
                    
                    HStack{
                        Text("Perfil")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3.weight(.semibold))
                            .foregroundColor(Color("BgIcons").opacity(0.7))
                            .padding(.horizontal, 10)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Minha conta")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3.weight(.semibold))
                            .foregroundColor(Color("BgIcons").opacity(0.7))
                            .padding(.horizontal, 10)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Configurações")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3.weight(.semibold))
                            .foregroundColor(Color("BgIcons").opacity(0.7))
                            .padding(.horizontal, 10)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Sair")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3.weight(.semibold))
                            .foregroundColor(Color("BgIcons").opacity(0.7))
                            .padding(.horizontal, 10)
                        
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 30)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct AcountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AcountView()
            AcountView()
                .preferredColorScheme(.dark)
        }
    }
}
