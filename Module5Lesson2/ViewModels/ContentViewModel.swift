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
        
        let count = 0...self.modules.count
        
        for index in count {
            if self.modules[index].id == moduleId {
                self.currentModuleIndex = index
                break
            }
        }
        self.selectedModule = self.modules[self.currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int) {
        if (lessonIndex < self.selectedModule!.content.lessons.count) {
            self.currentLessonIndex = lessonIndex
        }

        self.selectedLesson = self.selectedModule?.content.lessons[self.currentLessonIndex]
         
    }
    
    func hasNextLesson() -> Bool {
        if let myModule = self.selectedModule {
            return currentLessonIndex+1 < myModule.content.lessons.count
        }
        return false;
    }
    
    
}
