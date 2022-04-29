//
//  LessonLink.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-27.
//

import SwiftUI

struct LessonLinkCard: View {
    
    @State var lesson: Lesson
    
    var body: some View {
        ZStack(alignment:.leading) {
            Rectangle().padding().foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 10)
                .aspectRatio(CGSize(width: 335, height: 100), contentMode: .fit)
            HStack(spacing:20) {
                Text("\(self.lesson.id + 1)").font(Font.title)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(self.lesson.title)").bold()
                    HStack {
                        
                        Text("Video - ")
                        Text("\(self.lesson.duration)").font(.caption)
                    }
                    
                }
            }.frame(width: 350, height: 100)


            
        }.navigationTitle("Learn something huh?").padding()
    }
}

struct LessonLink_Previews: PreviewProvider {
    static var previews: some View {
        LessonLinkCard(
            lesson: Lesson(
                id: 0,
                title: "Constants and Variables",
                video: "http://microsoft.com",
                duration: "17 minutes",
                explanation: ""
            ))
    }
}
