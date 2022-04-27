//
//  Card.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-22.
//

import SwiftUI

struct Card: View {
    
    @State var mod: Module
    @State var type: String
    var body: some View {
        
        
                ZStack {
                    Rectangle().padding().foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 10)
                        .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                    HStack {
                        if (type=="test") {
                            Image(self.mod.test.image)
                                .resizable()
                                .frame(width: 124, height: 124, alignment: .center)
                                .clipShape(Circle())
                        }
                        else {
                            Image(self.mod.content.image)
                                .resizable()
                                .frame(width: 124, height: 124, alignment: .center)
                                .clipShape(Circle())
                        }

                        Spacer()
                        VStack(alignment: .leading, spacing: 25) {
                            if (type == "test") {
                                Text("\(self.mod.category) Test").bold().font(.headline)
                            }
                            else {
                                Text("Learn \(self.mod.category)").bold().font(.headline)
                            }
                            
                            Text(self.mod.content.description).font(.footnote)
                            HStack {
                                Image(systemName: "book")
                                    .resizable()
                                    .frame(width: 15, height: 15, alignment: .leading)
                                if (type == "test") {
                                    Text("\(self.mod.test.questions.count) questions").font(.caption)
                                }
                                else {
                                    Text("\(self.mod.content.lessons.count) lessons").font(.caption)
                                }
                                
                                Image(systemName: "clock")
                                    .resizable()
                                    .frame(width: 15, height: 15, alignment: .leading)
                                if (type == "test") {
                                    Text("\(self.mod.test.time)").font(.caption)
                                }
                                else {
                                    Text("\(self.mod.content.time)").font(.caption)
                                }
                                
                            }
                            
                        }
                    }.frame(width: 335, height: 175)


                    
                }
      



    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(mod: Module(
            id: 1,
            category: "Swift",
            content: Content(
                id: 1,
                image: "swift",
                time: "10",
                description: "Something i don't know",
                lessons: [Lesson]()),
            test: Test(
                id:1,
                image: "swift",
                time: "20",
                description: "Some more stuff",
                questions: [Question]())),
            type: "lesson")
    }
}
