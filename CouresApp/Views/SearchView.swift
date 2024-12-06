//
//  SearchView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 05/12/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var isLoading: Bool = false;
    @State private var searchListCourses: [Course]?
    @Namespace var namespace
    @State private var show = true
    @EnvironmentObject var view: SelectedDetailView
    @State private var selectedCourse: Course?
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack {
                TextField("Pesquisar curso pelo nome...", text: $searchText)
                    .padding(15)
                    .font(.system(size: 20))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.top, 5)
                    .padding(.horizontal)
                    .onChange(of: searchText) { newValue in
                        
                        if newValue.count > 3 {
                            isLoading.toggle()
                            searchAction(newValue)
                        } else if newValue.count < 3{
                            isLoading = false;
                            searchListCourses = []
                        }
                    }
                
                if isLoading {
                    Text("Carregando....")
                }
    
                Spacer()
                
                ScrollView {
                    
                    if (searchListCourses != nil) {
                        
                        VStack{
                            
                            ForEach(searchListCourses ?? []) { course in
                                
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
                .padding(.bottom, 10)
            }
            
            
            if view.show, let selectedCourse = selectedCourse {
                CourseDetailView(namespace: namespace, show: $view.show, selected: selectedCourse)
                    .frame(maxWidth: .infinity)
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func searchAction(_ query: String) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isLoading.toggle()
            searchListCourses = courses.filter { $0.title.localizedCaseInsensitiveContains(query) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
