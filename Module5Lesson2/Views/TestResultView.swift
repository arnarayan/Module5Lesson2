//
//  TestResultView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-06-03.
//

import SwiftUI

struct TestResultView: View {
    var numResults: Int
    @EnvironmentObject var model: ContentModel
    
    var headerResult: String {
        if (numResults<5) {
            return "Keep Trying"
        }
        return "Doing Awesome!"
    }
    
    var body: some View {
        VStack {
            Text("\(headerResult)").font(.title)
            Text("You got \(numResults) out of \(model.selectedModule?.test.questions.count ?? 0) questions correct.")
            Button(action: {
                model.selectedTag = nil
            }, label: {
                ZStack {
                    
                    RectangleCard(color: Color.green).frame(height: 100)

                    Text("Finish").foregroundColor(Color.white).bold().padding()
                }
            })
        }
    }
}


