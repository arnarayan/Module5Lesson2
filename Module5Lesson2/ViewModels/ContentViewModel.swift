//
//  ContentViewModel.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-19.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    @Published var nextLesson: Lesson?
    @Published var currentLesson: Lesson?
    
    var style: Data?
    
    
    init() {
        self.modules = DataService.getLocalData()
        self.style = DataService.getStyleData()
        self.nextLesson = Lesson.NullLesson
        self.currentLesson = Lesson.NullLesson
    }
    
    func setNextLesson(lesson: Lesson) {
        self.nextLesson = lesson
    }
    
    func setCurrentLesson(lesson: Lesson) {
        self.currentLesson = lesson
    }
    
    
}
