//
//  ContentViewModel.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-04-19.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    var style: Data?
    
    init() {
        self.modules = DataService.getLocalData()
        self.style = DataService.getStyleData()
    }
}
