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

            NavigationView {
                ScrollView() {
                    LazyVStack(alignment: .leading, spacing: 2) {
                        Text("What would you like to do Today?")
                    }.padding().font(Font.custom("Avenir Heavy", size: 16))
                    VStack {
                        ForEach(model.modules) {mod in
                            NavigationLink(
                                destination:LessonListView()
                                    .onAppear(perform: {
                                model.beginModule(mod.id)
                            }),
                                tag:100,
                                selection: $model.selectedTag,
                               label: {
                                Card(mod: mod, type: "content")
                            })
                            NavigationLink(
                                destination:LessonListView()
                                    .onAppear(perform: {
                                model.beginModule(mod.id)
                            }),
                                tag:200,
                                selection: $model.selectedTag,
                               label: {
                                Card(mod: mod, type: "test")
                                
                            })
                        }
                    }
                    Spacer()
                    
                    
                }.navigationTitle("Get Started")
                    .accentColor(.black)
            }.navigationViewStyle(.stack)



        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
