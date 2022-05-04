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
        
        if model.currentLesson != nil {
            let myVideo = model.currentLesson?.video ?? ""
            let url = URL(string: Constants.VideoUrl + myVideo)
            VStack {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                // Description
                
                // Next Lesson Button
                Button(action: {
                    model.currentLesson = model.nextLesson
                }, label: {
                    if (model.nextLesson != nil) {
                        Text("Next Lesson")
                    }
                    
                })
            }
        }
        
        
        


        
    }
}

struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LessonDetailView().environmentObject(ContentModel())
    }
}
