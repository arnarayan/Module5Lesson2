//
//  TestView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-05-29.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.selectedModule != nil {
            VStack {
                
                Text("Question \(model.currentQuestionIndex + 1) of \(model.selectedModule?.test.questions.count ?? 0)")
                CodeTextView()
                
            }.navigationTitle("\(model.selectedModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
        


        
        
    }
}


