//
//  Character.swift
//  SWAPI
//
//  Created by Marcus Klausen on 02/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

func isStringAnInt(string: String) -> Bool {
    return Int(string) != nil
}

class Character: Entity {
    
    var name: String
    var attributes: [String : Any]
    
    required init(name: String, attributes: [String : Any]) {
        self.name = name
        self.attributes = attributes
    }
	
	required convenience init?(withJson json: [String : Any]) {
		
		// Set json to mutable json
		var json = json
    
		
		// Retrieve name key for stored property
		guard let name = json["name"] as? String else { return nil }
		
		// Remove name value
		json.removeValue(forKey: "name")
        
        var data = [String: Any]()
        
        for (key, value) in json {
            
            // Check if string is int, if so, convert to int and append to data
            if let value = value as? String {
                if let num = Int(value) {
                    data[key] = num
                } else {
                    data[key] = value
                }
            }
        }
        
        
		
       
		
		self.init(name: name, attributes: data)
	}
    
}
