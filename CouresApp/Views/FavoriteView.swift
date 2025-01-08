//
//  FavoriteView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 05/12/24.
//

import SwiftUI

struct FavoriteView: View {
    @Namespace var namespace
    @State private var show = true
    @EnvironmentObject var view: SelectedDetailView
    @State private var selectedCourse: Course?
    
    var body: some View {
       
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                
                VStack{
                    
                    if !courses.contains(where: { $0.like }) {
                        Text("NENHUM CURSO FAVORITADO")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                    }
                    
                    ForEach(courses) { course in
                        if course.like {
                            CourseViewItem(namespace: namespace, show: $show, course: course)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    view.show = true
                                    selectedCourse = course
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    
                }
                
            }
            .ignoresSafeArea()
            .padding(.bottom, 20)
            .padding(.top, 20)
            
            if view.show, let selectedCourse = selectedCourse {
                CourseDetailView(namespace: namespace, show: $view.show, selected: selectedCourse)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
