//
//  LessonListView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-27.
//

import SwiftUI

struct LessonListView: View {
    
    @State var lessons: [Lesson]
    
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack(spacing:0) {
                    ForEach(lessons) {lesson in
                        LessonLinkCard(lesson: lesson)
                    }
                }
            }.navigationTitle("Learn Swift")
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView(lessons: [Lesson(
            id: 0,
            title: "Constants and Variables",
            video: "http://www.microsoft.com",
            duration: "17 minutes",
            explanation: "something else"
        )])
    }
}
