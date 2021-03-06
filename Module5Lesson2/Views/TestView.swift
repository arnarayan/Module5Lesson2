//
//  TestView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-05-29.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex = -1
    @State var numCorrect:Int = 0
    @State var submitted = false
    @State var isCorrectlyAnswered = false
    @State var isEndGame = false
    var body: some View {
        
        if model.selectedModule != nil && self.isEndGame == false {
            VStack(alignment:.leading, spacing: 0) {
                Text("Question \(model.currentQuestionIndex + 1) of \(model.selectedModule?.test.questions.count ?? 0)").padding()
                CodeTextView().padding(.horizontal, 20)
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<model.selectedQuestion!.answers.count, id:\.self) { index in
                            Button(action: {
                                self.selectedAnswerIndex = index
                            }, label: {
                                ZStack {
                                    if (submitted) {
                                        if (self.isCorrectlyAnswered==true && index == selectedAnswerIndex) {
                                            RectangleCard(color: Color.blue).frame(height: 100)
                                        }
                                        else if (self.isCorrectlyAnswered == false && index == model.selectedQuestion!.correctIndex) {
                                            RectangleCard(color: Color.blue).frame(height: 100)
                                        }
                                        else if (self.isCorrectlyAnswered == false && index == selectedAnswerIndex) {
                                            RectangleCard(color: Color.red).frame(height: 100)
                                        } else {
                                            RectangleCard(color: Color.green).frame(height: 100)
                                        }
                                        
                                    }else {
                                        RectangleCard(color: index == selectedAnswerIndex ? Color.gray : Color.green).frame(height: 100)
                                    }
                                    

                                    Text(model.selectedQuestion!.answers[index]).foregroundColor(Color.white).bold()
                                }
                                
                                
                            }).disabled(submitted)

                            
                        }
                    }
                }
                if (self.submitted == false) {
                    Button(action: {
                        if (selectedAnswerIndex == model.selectedQuestion!.correctIndex) {
                            numCorrect += 1
                            self.isCorrectlyAnswered = true
                        }
                        self.submitted = true
                    }, label: {
                        ZStack {
                            
                            RectangleCard(color: Color.green).frame(height: 100)

                            Text("Submit Answer").foregroundColor(Color.white).bold()
                                .padding()
                        }
                    }).disabled(selectedAnswerIndex == -1)
                } else if (model.hasNextTest() && self.isEndGame == false && self.submitted == true) {
                    Button(action: {
                        model.nextTest()
                        self.submitted = false
                        self.isCorrectlyAnswered = false
                        selectedAnswerIndex = -1
                    }, label: {
                        ZStack {
                            
                            RectangleCard(color: Color.green).frame(height: 100)

                            Text("Next Question").foregroundColor(Color.white).bold()
                                .padding()
                        }
                    })
                } else {
                    Button(action: {
                        self.isEndGame = true
                    }, label: {
                        ZStack {
                            
                            RectangleCard(color: Color.green).frame(height: 100)

                            Text("See Your Results").foregroundColor(Color.white).bold()
                                .padding()
                        }
                    })
                }
                


                
            }.navigationTitle("\(model.selectedModule?.category ?? "") Test")
        }
        else if (model.selectedModule == nil) {
            ProgressView()
        }
        
        if (self.isEndGame == true) {
            TestResultView(numResults: self.numCorrect)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(ContentModel())
    }
}
