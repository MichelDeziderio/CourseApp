//
//  CoursesModel.swift
//  CouresApp
//
//  Created by Michel Deziderio on 02/12/24.
//

import SwiftUI

class SelectedDetailView: ObservableObject {
    @Published var selected: Course?
    @Published var show: Bool = false
}

struct Course: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var image: String
    var teacher: String
    var background: String
    var like: Bool
}

var courses: [Course] = [
    Course(id: "SwiftUI", title: "SwiftUI", subTitle: "30 Horas - 29 Aulas", description: "Seja muito bem vindo ao Curso Desenvolvimento de APPs com Swift...", image: "app", teacher: "Michel Deziderio", background: "background-1", like: false),
    Course(id: "JavaScript", title: "JavaScript Moderno", subTitle: "10 Horas - 20 Aulas", description: "Seja muito bem vindo ao Curso Desenvolvimento Web Moderno com JavaScript...", image: "website", teacher: "Michel Deziderio", background: "background-2", like: false),
    Course(id: "uiUx", title: "UI/UX Design", subTitle: "5 Horas - 10 Aulas", description: "Seja muito bem vindo ao Curso UI/UX Design com Figma...", image: "uiux", teacher: "Michel Deziderio", background: "background-1", like: false),
    Course(id: "WebSite", title: "HTML, CSS e JavaScript", subTitle: "80 Horas - 30 Aulas", description: "Seja muito bem vindo ao Curso Desenvolvimento de Web Sites com HTML, CSS e JavaScript...", image: "website", teacher: "Michel Deziderio", background: "background-2", like: false),
    Course(id: "Angular", title: "Angular Avançado", subTitle: "10 Horas - 20 Aulas", description: "Seja muito bem vindo ao Curso Desenvolvimento Single Application usando Angular...", image: "app", teacher: "Michel Deziderio", background: "background-1", like: false),
    Course(id: "NestJs", title: "NestJs CRUD", subTitle: "7 Horas - 15 Aulas", description: "Seja muito bem vindo ao Curso NestJS, aprenda a fazer um CRUD sem dor de cabeça...", image: "website", teacher: "Michel Deziderio", background: "background-2", like: false),
]


