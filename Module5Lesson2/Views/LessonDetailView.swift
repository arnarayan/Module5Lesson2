//
//  LessonDetailView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-29.
//

import SwiftUI
import AVKit

struct LessonDetailView: View {
    @EnvironmentObject var model: ContentModel

    
    var body: some View {
        let myLesson = model.selectedLesson

        let myVideo = myLesson?.video ?? ""
        let url = URL(string: Constants.VideoUrl + myVideo)
        VStack {
            if (url != nil) {
                VideoPlayer(player: AVPlayer(url: url!))
                
                // Description
                
                // Next Lesson Button
                if (model.hasNextLesson()) {
                    
                    let nextTitle = model.selectedModule!.content.lessons[model.currentLessonIndex + 1].title
                    ZStack {
                        Rectangle().padding().foregroundColor(Color.green)
                            .cornerRadius(30)
                            .shadow(color: .gray, radius: 10)
                            .padding()
                            .frame(height: 100)
                        Button(action: {
                            model.beginLesson(model.currentLessonIndex+1)
                        }, label: {
                            Text("Next Lesson:" + nextTitle!).foregroundColor(Color.white).bold()
                        })
                    }

                }
            }
            
 

        }

        
        
        


        
    }
}

struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LessonDetailView().environmentObject(ContentModel())
    }
}
