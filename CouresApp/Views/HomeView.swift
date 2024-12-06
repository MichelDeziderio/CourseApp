//
//  Home.swift
//  CouresApp
//
//  Created by Michel Deziderio on 05/12/24.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    @State private var selectedCourse: Course?
    @EnvironmentObject var view: SelectedDetailView
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            Image("top-app")
                .resizable(capInsets: EdgeInsets(top: -4.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
                .offset(y: -200)
                
            
            
            ScrollView {
                
                Text("Cursos".uppercased())
                    .font(.footnote.weight(.bold))
                    .foregroundColor(Color(hue: 1.0, saturation: 0.001, brightness: 0.399))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !view.show {
                    
                    VStack{
                        
                        ForEach(courses) { course in
                            
                            CourseViewItem(namespace: namespace, show: $show, course: course)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                        view.show = true
                                        selectedCourse = course
                                    }
                                }
                                .padding(.vertical)
                            
                        }
                        
                    }
                    
                }
                
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .padding(.bottom, 50)
            
            if view.show, let selectedCourse = selectedCourse {
                CourseDetailView(namespace: namespace, show: $view.show, selected: selectedCourse)
                    .frame(maxWidth: .infinity)
            }
                        
        }
    }
}

struct Home_Previews: PreviewProvider {
    static let view: SelectedDetailView = {
        let view = SelectedDetailView()
        view.show = true
        return view
    }()
    
    static var previews: some View {
        HomeView()
            .environmentObject(view)
    }
}
