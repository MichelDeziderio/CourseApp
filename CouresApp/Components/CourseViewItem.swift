//
//  CourseViewItem.swift
//  CouresApp
//
//  Created by Michel Deziderio on 02/12/24.
//

import SwiftUI

struct CourseViewItem: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    var course: Course
    
    var body: some View {
        ZStack {
            
                VStack {
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(course.title)
                            .font(.title.weight(.bold))
                            .matchedGeometryEffect(id: "\(course.id)title", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        
                        Text(course.subTitle)
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: "\(course.id)subtitle", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 1)
                        
                        
                        Text(course.description)
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: "\(course.id)description", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                            )
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "\(course.id)blur", in: namespace)
                        
                    )
                    
                }
                .foregroundColor(.white)
                .background(
                    Image(course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(course.id)imageCourse", in: namespace)
                        .offset(y: -30)
                        .blur(radius: 0.2)
                )
                .background(
                    Image(course.background)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "\(course.id)background", in: namespace)
                        .blur(radius: 1)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "\(course.id)mask", in: namespace)
                )
                .frame(height: 300)
                .padding(20)
                
            }
            .frame(height: 300)
        
    }
}

struct CourseViewItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        Group {
            CourseViewItem(namespace: namespace, show: .constant(true), course: PreviewCourseData)
            CourseViewItem(namespace: namespace, show: .constant(true), course: PreviewCourseData)
                .preferredColorScheme(.dark)
        }
    }
}
