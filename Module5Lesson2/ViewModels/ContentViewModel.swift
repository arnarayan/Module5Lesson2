//
//  ContentViewModel.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-19.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    @Published var selectedModule: Module?
    var currentModuleIndex = 0
    
    @Published var selectedLesson: Lesson?
    var currentLessonIndex = 0
    

    
    var style: Data?
    
    
    init() {
        self.modules = DataService.getLocalData()
        self.style = DataService.getStyleData()

    }

    
    func beginModule(_ moduleId: Int) {
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        selectedModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int) {
        if (lessonIndex < selectedModule!.content.lessons.count) {
            currentLessonIndex = lessonIndex
        }

        selectedLesson = selectedModule?.content.lessons[currentLessonIndex]
    }
    
    func hasNextLesson() -> Bool {
        if let myModule = self.selectedModule {
            return currentLessonIndex+1 < myModule.content.lessons.count
        }
        return false;
    }
    
    
}
