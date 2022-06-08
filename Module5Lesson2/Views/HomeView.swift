//
//  ContentView.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-19.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {

        if let module = model.modules {
            NavigationView {
                ScrollView() {
                    LazyVStack(alignment: .leading, spacing: 2) {
                        Text("What would you like to do Today?")
                    }.padding().font(Font.custom("Avenir Heavy", size: 16))
                    VStack {

                        Button(action: {
                            print(module[0].content.description)
                            
                        }, label: {
                            Text("content 0")
                            //Card(shownModule: module[0], type: "content")

                        })
                        
                        Button(action: {
                            print(module[0].test.description)
                            
                        }, label: {
                            Text("test 0")
                            //Card(shownModule: module[0], type: "test")

                        })

                        var content1card = Card(shownModule: module[1], type: "content", description:  module[1].content.description)

                        Button(action: {
                            print(module[1].content.description)
                            content1card.description = module[1].content.description
                        }, label: {
                            content1card
                            //Card(shownModule: module[1], type: "content", description: module[1].content.description)
                            //Text("content 1")

                        })
                        
                        
                        var test1card = Card(shownModule: module[1], type: "test", description: module[1].test.description)

                        Button(action: {
                            print(module[1].test.description)
                            test1card.description = module[1].test.description
 
                            
                        }, label: {
                            test1card
                            //Text("test 1")

                        })
                            


                    }
                    Spacer()
                    
                    
                }.navigationTitle("Get Started").accentColor(.black)
            }.navigationViewStyle(.stack)
                .onChange(of: model.selectedTag, perform: { changedValue in
                    if changedValue == nil
                    {
                        model.selectedModule = nil
                    }
            })


        }
            

        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
