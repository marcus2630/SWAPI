//
//  Character.swift
//  SWAPI
//
//  Created by Marcus Klausen on 02/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


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
		
		// NOTE: - Not in use right now, might come in handy, else remove in final
		struct Key {
			static let name = "name"
			static let height = "height"
			static let mass = "mass"
			static let hairColor = "hair_color"
			static let skinColor = "skin_color"
			static let eyeColor = "eye_color"
			static let birthYear = "birth_year"
			static let gender = "gender"
		}
		
		// Remove name value
		json.removeValue(forKey: "name")
		
		self.init(name: name, attributes: json)
	}
    
}
