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
        
        if let myLesson = model.selectedLesson {
            let myVideo = myLesson.video
            let url = URL(string: Constants.VideoUrl + myVideo!)
            VStack {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                // Description
                
                // Next Lesson Button
                if (model.hasNextLesson()) {
                    Button(action: {
                        model.beginLesson(model.currentLessonIndex+1)
                    }, label: {
                            Text("Next Lesson")
                    })
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
