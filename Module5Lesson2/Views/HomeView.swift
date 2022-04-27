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
                        Text("Get Started!").bold()
                        Text("What would you like to do Today?")
                    }.padding().font(Font.custom("Avenir Heavy", size: 16))
                    VStack {
                        ForEach(model.modules) {mod in
                            Card(mod: mod, type: "content")
                            Card(mod: mod, type: "test")
                        }
                    }
                    Spacer()
                    
                    
                }
            }



        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
