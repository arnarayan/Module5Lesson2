//
//  ContentViewModel.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-19.
//

import Foundation

class ContentModel: ObservableObject {
    var dataService = DataService()
    var uiSelections = UiSelections()
    @Published var modules: [Module]?
    var tempModules: [Module]?
    
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
    var numberOfCorrectAnswers = 0
    
    var remoteDataUrl: String = ""
    var session: URLSession = URLSession.shared
    
    
    init() {
        self.tempModules = self.dataService.getLocalData()
        self.style = self.dataService.getStyleData()
        self.getRemoteData()
        
        
        

    }
    
    func getRemoteData()  {
        self.remoteDataUrl = "https://arnarayan.github.io/learningapp-data/data2.json"
        let sendingUrl = URL(string: self.remoteDataUrl)
        var request = URLRequest(url: sendingUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.allHTTPHeaderFields = setHeaders()
        request.httpMethod = "GET"

        let dataTask = self.session.dataTask(with: request) { (data, response, error) in
            self.responseHandler(data: data, response: response, error: error)
        }
        dataTask.resume()


    }
    
    func setHeaders() -> [String:String] {
        return [:]
    }
    
    func responseHandler(data:Data?, response: URLResponse?, error: Error?) {
        
        if (error == nil && data != nil) {
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([Module].self, from: data!)
                DispatchQueue.main.async {
                    self.tempModules! += response
                    self.modules = self.tempModules
                    
                }
                
                
            }
            catch {
                print("could not serialize the response")
            }
            
        }
    }

    
    func beginModule(_ moduleId: Int) {
        if (self.modules != nil && self.selectedModule == nil) {
            let count = 0...self.modules!.count
            
            for index in count {
                if self.modules![index].id == moduleId {
                    self.currentModuleIndex = index
                    break
                }
            }
            self.selectedModule = self.modules![self.currentModuleIndex]
        }
        

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
    
    func hasNextTest() -> Bool {
        if let myModule = self.selectedModule {
            return currentQuestionIndex+1 < myModule.test.questions.count
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
    
    func nextTest() {
        if self.hasNextTest() {
            currentQuestionIndex += 1
            selectedQuestion = selectedModule?.test.questions[currentQuestionIndex]
            self.codeTextView = addStyling(self.selectedQuestion?.content ?? "")
        }
        else {
            currentQuestionIndex = 0
            selectedQuestion = nil
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
