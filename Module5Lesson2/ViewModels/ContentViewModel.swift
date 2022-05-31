//
//  ContentViewModel.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-19.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    
    // selected Module
    @Published var selectedModule: Module?
    var currentModuleIndex = 0
    
    
    // selected lesson
    @Published var selectedLesson: Lesson?
    var currentLessonIndex = 0
    
    // selected question
    @Published var selectedQuestion: Question?
    var currentQuestionIndex = 0
    
    @Published var codeTextView = NSAttributedString()
    
    @Published var selectedTag: Int?
    @Published var selectedTestTag: Int?
    
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
        self.codeTextView = addStyling(self.selectedLesson?.explanation ?? "") 
         
    }
    
    func hasNextLesson() -> Bool {
        if let myModule = self.selectedModule {
            return currentLessonIndex+1 < myModule.content.lessons.count
        }
        return false;
    }
    
    func beginTest(_ moduleId:Int) {
        // Set the current module
        beginModule(moduleId)
        // set the current question
        currentQuestionIndex = 0
        if (selectedModule?.test.questions.count ?? 0 > 0) {
            selectedQuestion = selectedModule?.test.questions[currentQuestionIndex]
            self.codeTextView  = addStyling(self.selectedQuestion?.content ?? "")
        }
    }
    
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        var resultsString = NSAttributedString()
        var data = Data()
        // Add the styling data
        if (self.style != nil) {
            data.append(self.style!)
        }
        
        // add the html data
        data.append(Data(htmlString.utf8))
        
        // convert to attributed string
        do {
            let attribtedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                resultsString = attribtedString

        }
        catch {
            print("couldnt turn html to attributed string")
        }
        
        
        return resultsString
    }
    
    
}
