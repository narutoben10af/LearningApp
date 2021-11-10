//
//  ContentModel.swift
//  LearningApp
//
//  Created by Lim Si Eian on 31/10/21.
//

import Foundation

class ContentModel: ObservableObject 
{
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init()
    {
        getLocalData()
    }
    
    
    
    func getLocalData()
    {
        //Get URL to the JSON file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: ".json")
        do
        {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonURL!)
            
            //Try to Decode the json into array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //Assign parsed modules to modules property
            self.modules = modules
            
        }
        catch
        {
            //TODO Log error
            print("Couldn't parse local data")
            fatalError()
        }
        
        //Parse the style data
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do
        {
            //Read the file into a data object
            let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
        }
        catch
        {
            //Log error
            print("Couldn't parse style data")
        }
    }
}
