//
//  LessonListView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-27.
//

import SwiftUI

struct LessonListView: View {
    
    @EnvironmentObject var viewModel: ContentModel
    
    var body: some View {
            ScrollView() {
                VStack(spacing:0) {
                    if let myModule = viewModel.selectedModule {
                        ForEach(0..<myModule.content.lessons.count) { index in
                            NavigationLink(
                                destination:
                                    LessonDetailView()
                                    .onAppear(perform: {
                                        viewModel.beginLesson(index)
                                    
                                    }),
                                label: {
                                    
                                    LessonLinkCard(lesson: (viewModel.selectedModule?.content.lessons[index])!)
                                    
                                })
                        }
                    }
                    

                }
            }.navigationTitle("Learn Swift")
                .accentColor(.black)
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView().environmentObject(ContentModel())
    }
}
