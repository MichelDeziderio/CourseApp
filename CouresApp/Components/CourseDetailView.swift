//
//  CourseDetailView.swift
//  CouresApp
//
//  Created by Michel Deziderio on 02/12/24.
//

import SwiftUI
import SwiftUIFontIcon

struct CourseDetailView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @EnvironmentObject var view: SelectedDetailView
    var selected: Course
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                cover
                moreDetails
                    .offset(y: 60)
            }
            .ignoresSafeArea()
            .background(Color(("Background")))
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                    view.show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            
            Spacer()
            
        }
        
        
    }
    
    var cover: some View {
        
            VStack {
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 600)
            .foregroundColor(.black)
            .background(
                Image(selected.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(selected.id)imageCourse", in: namespace)
                    .blur(radius: 0.5)

            )
            .background(
                Image(selected.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "\(selected.id)background", in: namespace)
                    .blur(radius: 1)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "\(selected.id)mask", in: namespace)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text(selected.title)
                        .font(.title.weight(.bold))
                        .matchedGeometryEffect(id: "\(selected.id)title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    
                    Text(selected.description)
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "\(selected.id)description", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 1)
                    
                    Text(selected.subTitle)
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "\(selected.id)subtitle", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Divider()
                    
                    HStack {
                        Image("teacher")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .cornerRadius(10)
                            .padding(8)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                            
                        Text(selected.teacher)
                            .font(.footnote)
                    }
                    
                }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                            )
                            .matchedGeometryEffect(id: "\(selected.id)blur", in: namespace)
                    )
                    .offset(y: 250)
                    .padding(20)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                
            )
            
    }
    
    var moreDetails: some View {
        VStack {
            
            HStack {
                
                FontIcon.text(.awesome5Solid(code: .check_circle), fontsize: 30, color: Color("BgIcons").opacity(0.2))
                
                Text("Garantia de 90 dias")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .opacity(0.5)
                    
            }
            .padding(.horizontal, 20)
            .frame(height: 70)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                    )
            )
            .padding(.bottom, 10)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            
            
            HStack {
                
                FontIcon.text(.awesome5Solid(code: .thumbs_up), fontsize: 30, color: Color("BgIcons").opacity(0.2))
                
                Text("Com taxa 70% aprovação")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .opacity(0.5)
                    
            }
            .padding(.horizontal, 20)
            .frame(height: 70)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                    )
            )
            .padding(.bottom, 10)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            
            HStack {
                
                FontIcon.text(.awesome5Solid(code: .user_plus), fontsize: 30, color: Color("BgIcons").opacity(0.2))
                
                Text("300+ alunos nesse curso")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .opacity(0.5)
                    
            }
            .padding(.horizontal, 20)
            .frame(height: 70)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                    )
            )
            .padding(.bottom, 10)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            
 
        }
        .padding()
        .frame(height: 380, alignment: .topTrailing)
        
        
        
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        Group {
            CourseDetailView(namespace: namespace, show: .constant(true), selected: PreviewCourseData)
            CourseDetailView(namespace: namespace, show: .constant(true), selected: PreviewCourseData)
                .preferredColorScheme(.dark)
        }
    }
}
