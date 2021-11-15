//
//  ContentModel.swift
//  LearningApp
//
//  Created by Lim Si Eian on 31/10/21.
//

import Foundation

class ContentModel: ObservableObject 
{
    //List of Modules
    @Published var modules = [Module]()
    
    // Current Module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
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
    
    func beginModule(_ moduleid:Int)
    {
        //Find the index for this module ID
        for index in 0..<modules.count
        {
            if modules[index].id == moduleid
            {
                //Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        //Set the current module
        currentModule = modules[currentModuleIndex]
    }
}
