//
//  TabBarView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 04/12/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TabBarView: View {
    @EnvironmentObject var selectedTab: selectedView
    @State var selectedTabAnimation: TabBar?
    @Namespace var animation
    var body: some View {
        
        HStack {
            
            ForEach(tabBarsList) { item in
                
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab.pageView = item.tab
                    }
                } label: {
                    VStack(spacing: 0){
                        FontIcon.text(.awesome5Solid(code: item.icon), fontsize: 30, color: selectedTab.pageView == item.tab ? Color("BgIcons") : Color("BgIcons").opacity(0.3))
                            .symbolVariant(.fill)
                            .frame(width: 44, height: 30)
                            .blendMode(selectedTab.pageView == item.tab ? .overlay : .normal)
                        
                        Text(item.tab)
                            .font(.footnote.weight(.semibold))
                            .padding(.top, 10)
                            .lineLimit(1)
                            .foregroundColor(selectedTab.pageView == item.tab ? Color("BgIcons") : Color("BgIcons").opacity(0.5))
                            .blendMode(selectedTab.pageView == item.tab ? .overlay : .normal)
                    }
                    .frame(maxWidth: .infinity)
                    
                }
            }
            
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in:
            RoundedRectangle(cornerRadius: 34, style: .continuous))
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .background(
            HStack {
                
                if selectedTab.pageView == "PESQUISAR" { Spacer() }
                if selectedTab.pageView == "FAVORITOS" {
                    Spacer()
                    Spacer()
                }
                if selectedTab.pageView == "MENU" { Spacer() }
                
                Circle().fill(Color("BgTab")).frame(width: 90)
                    .padding(.horizontal, 8)
                    
                
                if selectedTab.pageView == "HOME" { Spacer() }
                if selectedTab.pageView == "PESQUISAR" {
                    Spacer()
                    Spacer()
                }
                if selectedTab.pageView == "FAVORITOS" { Spacer() }
            }
        )
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
            TabBarView()
                .preferredColorScheme(.dark)
        }
    }
}
