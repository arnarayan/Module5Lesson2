//
//  DataService.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-05.
//

import Foundation


class DataService: ObservableObject {
    
    var remoteDataUrl: String = ""
    var session: URLSession = URLSession.shared
   
    

    
    func getLocalData() -> [Module] {
        // Get path to the json file within the app bundle
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            let fileUrl = URL(fileURLWithPath: path)
            
            do{
                let data = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let response = try decoder.decode([Module].self, from: data)

                
                return response
                
            }
            catch{
                print("could not serialize")
                print(error)
            }
            
        }

        return [Module]()
    }
    

    
    
   func getStyleData() -> Data {
        if let path = Bundle.main.path(forResource: "style", ofType: "html") {
            let fileUrl = URL(fileURLWithPath: path)
            
            do{
                let data = try Data(contentsOf: fileUrl)

                
                return data
                
            }
            catch{
                print("could not read style data")
                print(error)
            }
            
        }
        return Data()
    }
}
