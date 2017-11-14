//
//  Character.swift
//  SWAPI
//
//  Created by Marcus Klausen on 02/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class Starship: Entity {
	
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
			static let make = "manufacturer"
			static let cost = "cost_in_credits"
			static let lenght = "lenght"
			static let classType = "starship_class"
			static let crew = "crew"
		}
		
		// Retrieve name key for stored property
		guard let name = json["name"] as? String else { return nil }
		
		// Remove name value
		json.removeValue(forKey: "name")
		
		
		
		self.init(name: name, attributes: json)
	}
	
	

			
	
}



