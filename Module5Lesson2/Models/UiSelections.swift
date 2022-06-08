//
//  UiSelections.swift
//  Module5Lesson2
//
//  Created by Anand Narayan on 2022-06-08.
//

import Foundation

class UiSelections: ObservableObject {
    
    @Published var description:String
    
    init() {
        description = ""
    }

}
