//
//  Card.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-22.
//

import SwiftUI

struct Card: View {
    
    @EnvironmentObject var viewModel: ContentModel
    
    var shownModule: Module?
    var type: String
    var description: String
    
    var body: some View {

        if let myModule = shownModule {
            NavigationLink(
                destination:TempTestView(description: description),
                tag:100,
                selection: $viewModel.selectedTag,
               label: {
                   ZStack {
                       Rectangle().padding().foregroundColor(.white)
                           .cornerRadius(15)
                           .shadow(color: .gray, radius: 10)
                           .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                       HStack {
                           if (type=="test") {
                               Image(myModule.test.image)
                                   .resizable()
                                   .frame(width: 124, height: 124, alignment: .center)
                                   .clipShape(Circle())
                           }
                           else {
                               Image(myModule.content.image)
                                   .resizable()
                                   .frame(width: 124, height: 124, alignment: .center)
                                   .clipShape(Circle())
                           }

                           Spacer()
                           VStack(alignment: .leading, spacing: 25) {
                               if (type == "test") {
                                   Text("\(myModule.category) Test").bold().font(.headline)
                               }
                               else {
                                   Text("Learn \(myModule.category)").bold().font(.headline)
                               }
                               
                               Text(myModule.content.description).font(.footnote)
                               HStack {
                                   Image(systemName: "book")
                                       .resizable()
                                       .frame(width: 15, height: 15, alignment: .leading)
                                   if (type == "test") {
                                       Text("\(myModule.test.questions.count) questions").font(.caption)
                                   }
                                   else {
                                       Text("\(myModule.content.lessons.count) lessons").font(.caption)
                                   }
                                   
                                   Image(systemName: "clock")
                                       .resizable()
                                       .frame(width: 15, height: 15, alignment: .leading)
                                   if (type == "test") {
                                       Text("\(myModule.test.time)").font(.caption)
                                   }
                                   else {
                                       Text("\(myModule.content.time)").font(.caption)
                                   }
                                   
                               }
                               
                           }
                       }.frame(width: 335, height: 175)


                       
                   }
            })
        }
        
        
        

        





    }
    

    

}
