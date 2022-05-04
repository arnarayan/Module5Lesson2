//
//  LessonListView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-27.
//

import SwiftUI

struct LessonListView: View {
    
    @EnvironmentObject var viewModel: ContentModel
    @State var lessons: [Lesson]
    
    var body: some View {
            ScrollView() {
                VStack(spacing:0) {
                    ForEach(0..<lessons.count) {index in
                        NavigationLink(
                            destination:
                                LessonDetailView()
                                .onAppear(perform: {
                                    viewModel.setCurrentLesson(lesson: lessons[index])
                                    if (index < lessons.count-1) {
                                        viewModel.setNextLesson(lesson: lessons[index+1])
                                        
                                    }
                                    else {
                                        
                                        viewModel.setNextLesson(lesson: Lesson.NullLesson)
                                        
                                    }
                                
                                }),
                            label: {
                                
                                LessonLinkCard(lesson: lessons[index])
                                
                            })
                    }
                }
            }.navigationTitle("Learn Swift")
                .accentColor(.black)
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
        )]).environmentObject(ContentModel())
    }
}
